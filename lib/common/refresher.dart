// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pull_to_refresh/pull_to_refresh.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';

class CommonRefresher extends StatefulWidget {
  const CommonRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
    //
    this.scrollController,
  });

  final Widget child;
  final void Function()? onRefresh;
  final ScrollController? scrollController;

  @override
  State<CommonRefresher> createState() => _CommonRefresherState();
}

class _CommonRefresherState extends State<CommonRefresher> {
  late final RefreshController controller;

  @override
  void initState() {
    super.initState();
    controller = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh == null) return widget.child;

    return SmartRefresher(
      enablePullDown: true,
      enableTwoLevel: true,
      onRefresh: () {
        widget.onRefresh?.call();
        controller.refreshCompleted();
      },
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
