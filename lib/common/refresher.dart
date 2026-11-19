// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pull_to_refresh/pull_to_refresh.dart';

// Project imports:
import 'package:uikit/theme/color_theme_data.dart';

/// Pull-to-refresh around a scrollable [child].
///
/// The indicator stays on screen until the [Future] returned by [onRefresh]
/// completes, then hides. A callback that returns nothing hides it at once.
class CommonRefresher extends StatefulWidget {
  const CommonRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
    //
    this.scrollController,
  });

  final Widget child;
  final FutureOr<void> Function()? onRefresh;
  final ScrollController? scrollController;

  @override
  State<CommonRefresher> createState() => _CommonRefresherState();
}

class _CommonRefresherState extends State<CommonRefresher> {
  final RefreshController controller = RefreshController();

  Future<void> _refresh() async {
    try {
      await widget.onRefresh?.call();
      if (mounted) controller.refreshCompleted();
    } catch (_) {
      if (mounted) controller.refreshFailed();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh == null) return widget.child;

    return SmartRefresher(
      enablePullDown: true,
      onRefresh: _refresh,
      controller: controller,
      scrollController: widget.scrollController,
      header: MaterialClassicHeader(
        color: context.iconColors.success,
        backgroundColor: context.surfaceColors.primary,
      ),
      child: widget.child,
    );
  }
}
