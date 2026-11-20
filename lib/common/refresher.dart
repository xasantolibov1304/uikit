// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

// Project imports:
import 'package:uikit/components/loaders/logo_loader.dart';
import 'package:uikit/components/loaders/lottie_loader.dart';
import 'package:uikit/theme/color_theme_data.dart';
import 'package:uikit/theme/refresher/uikit_refresher_theme.dart';

/// Pull-to-refresh around a scrollable [child].
///
/// The indicator stays on screen until the [Future] returned by [onRefresh]
/// completes, then hides. A callback that returns nothing hides it at once.
///
/// A [child] that does not set its own `physics` can be pulled even when its
/// content is shorter than the screen (an empty list, a single card).
///
/// The indicator is the standard spinner, or — when set once for the whole
/// app with [UikitRefresherTheme] — a Lottie animation ([LottieLoader]) or
/// the app's logo ([LogoLoader]). [logo] overrides the theme logo here.
class CommonRefresher extends StatelessWidget {
  const CommonRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
    this.logo,
    //
    @Deprecated('Not used any more — pass the controller to the child scroll view.')
    this.scrollController,
  });

  final Widget child;
  final FutureOr<void> Function()? onRefresh;

  /// Overrides [UikitRefresherTheme.logo] for this refresher.
  final Widget? logo;

  final ScrollController? scrollController;

  Future<void> _refresh() async {
    try {
      await onRefresh?.call();
    } catch (_) {
      // A failed refresh only hides the indicator; the caller reports errors.
    }
  }

  @override
  Widget build(BuildContext context) {
    if (onRefresh == null) return child;

    // The app's own scroll behavior, made always scrollable so a short list
    // can be pulled too.
    final behavior = ScrollConfiguration.of(context);
    final scrollable = ScrollConfiguration(
      behavior: behavior.copyWith(
        physics: AlwaysScrollableScrollPhysics(parent: behavior.getScrollPhysics(context)),
      ),
      child: child,
    );

    final style = Theme.of(context).refresherTheme;
    final color = style?.color ?? context.iconColors.success;
    final logo = this.logo ?? style?.logo;
    final lottieAsset = this.logo == null ? style?.lottieAsset : null;

    if (lottieAsset == null && logo == null) {
      return RefreshIndicator(
        onRefresh: _refresh,
        color: color,
        backgroundColor: context.surfaceColors.primary,
        child: scrollable,
      );
    }

    return CustomMaterialIndicator(
      onRefresh: _refresh,
      backgroundColor: context.surfaceColors.primary,
      clipBehavior: Clip.antiAlias,
      indicatorBuilder: (context, controller) {
        final size = CustomMaterialIndicator.defaultIndicatorSize.width;
        final progress = controller.isLoading || controller.isComplete || controller.isFinalizing
            ? null
            : controller.value.clamp(0.0, 1.0);

        if (lottieAsset != null) {
          // Plays on its own from the moment the indicator appears (or follows
          // the finger with lottieScrubOnPull); paused while hidden.
          final scrub = style?.lottieScrubOnPull ?? false;
          return LottieLoader(
            asset: lottieAsset,
            package: style?.lottiePackage,
            pullEnd: style?.lottiePullEnd ?? 1,
            size: size,
            progress: controller.isIdle ? 0 : (scrub ? progress : null),
          );
        }
        return LogoLoader(logo: logo!, color: color, size: size, progress: progress);
      },
      child: scrollable,
    );
  }
}
