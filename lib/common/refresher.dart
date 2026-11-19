// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/color_theme_data.dart';

/// Pull-to-refresh around a scrollable [child].
///
/// The indicator stays on screen until the [Future] returned by [onRefresh]
/// completes, then hides. A callback that returns nothing hides it at once.
///
/// A [child] that does not set its own `physics` can be pulled even when its
/// content is shorter than the screen (an empty list, a single card).
class CommonRefresher extends StatelessWidget {
  const CommonRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
    //
    @Deprecated('Not used any more — pass the controller to the child scroll view.')
    this.scrollController,
  });

  final Widget child;
  final FutureOr<void> Function()? onRefresh;
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

    return RefreshIndicator(
      onRefresh: _refresh,
      color: context.iconColors.success,
      backgroundColor: context.surfaceColors.primary,
      child: ScrollConfiguration(
        behavior: behavior.copyWith(
          physics: AlwaysScrollableScrollPhysics(parent: behavior.getScrollPhysics(context)),
        ),
        child: child,
      ),
    );
  }
}
