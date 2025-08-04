// Flutter imports:
import 'package:flutter/widgets.dart';

enum LoadingStatus { loading, stable }

typedef EndOfPageListenerCallback = VoidCallback;

class LazyLoadScrollView extends StatefulWidget {
  const LazyLoadScrollView({
    required this.child,
    required this.onEndOfPage,
    //
    this.scrollDirection = Axis.vertical,
    this.isLoading = false,
    this.scrollOffset = 100,
    super.key,
  });

  final Widget child;
  final EndOfPageListenerCallback onEndOfPage;

  final Axis scrollDirection;
  final bool isLoading;
  final int scrollOffset;

  @override
  State<StatefulWidget> createState() => LazyLoadScrollViewState();
}

class LazyLoadScrollViewState extends State<LazyLoadScrollView> {
  LoadingStatus loadMoreStatus = LoadingStatus.stable;

  @override
  void didUpdateWidget(LazyLoadScrollView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      loadMoreStatus = LoadingStatus.stable;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: widget.child,
      onNotification: (notification) => _onNotification(notification, context),
    );
  }

  bool _onNotification(ScrollNotification notification, BuildContext context) {
    if (widget.scrollDirection == notification.metrics.axis) {
      if (notification is ScrollUpdateNotification) {
        if (notification.metrics.maxScrollExtent >
                notification.metrics.pixels &&
            notification.metrics.maxScrollExtent -
                    notification.metrics.pixels <=
                widget.scrollOffset) {
          _loadMore();
        }
        return true;
      }

      if (notification is OverscrollNotification) {
        if (notification.overscroll > 0) {
          _loadMore();
        }
        return true;
      }
    }
    return false;
  }

  void _loadMore() {
    if (loadMoreStatus == LoadingStatus.stable) {
      loadMoreStatus = LoadingStatus.loading;
      widget.onEndOfPage();
    }
  }
}
