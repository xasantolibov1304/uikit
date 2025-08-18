// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/indicators/segment_progress_indicator.dart';

enum ProgressIndicatorPosition {
  top,
  bottom,
}

class PagedSegmentProgressIndicator extends StatefulWidget {
  const PagedSegmentProgressIndicator({
    required this.pages,
    required this.currentPageIndex,
    required this.onPageChanged,
    required this.segmentProgressIndicator,
    this.progressIndicatorPosition = ProgressIndicatorPosition.top,
    this.showProgressIndicator = true,
    super.key,
  });

  /// List of page widgets to display
  final List<Widget> pages;

  /// Current page index (0-based)
  final int currentPageIndex;

  /// Callback when page changes
  final ValueChanged<int> onPageChanged;

  /// Segment progress indicator with autoplay functionality
  final SegmentProgressIndicator segmentProgressIndicator;

  /// Position of the progress indicator
  final ProgressIndicatorPosition progressIndicatorPosition;

  /// Whether to show the progress indicator
  final bool showProgressIndicator;

  @override
  State<PagedSegmentProgressIndicator> createState() =>
      _PagedSegmentProgressIndicatorState();
}

class _PagedSegmentProgressIndicatorState
    extends State<PagedSegmentProgressIndicator> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.currentPageIndex;
    _pageController = PageController(initialPage: widget.currentPageIndex);
  }

  @override
  void didUpdateWidget(PagedSegmentProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPageIndex != widget.currentPageIndex) {
      _currentPageIndex = widget.currentPageIndex;
      _pageController.animateToPage(
        widget.currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(int pageIndex) {
    if (pageIndex != _currentPageIndex &&
        pageIndex >= 0 &&
        pageIndex < widget.pages.length) {
      _currentPageIndex = pageIndex;
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      widget.onPageChanged(pageIndex);
    }
  }

  void _handlePageChanged(int pageIndex) {
    if (pageIndex != _currentPageIndex &&
        pageIndex >= 0 &&
        pageIndex < widget.pages.length) {
      _currentPageIndex = pageIndex;
      widget.onPageChanged(pageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progressIndicator = _buildProgressIndicator();
    final pageContent = _buildPageContent();

    if (widget.progressIndicatorPosition == ProgressIndicatorPosition.top) {
      return Column(
        children: [
          if (widget.showProgressIndicator) progressIndicator,
          Expanded(child: pageContent),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(child: pageContent),
          if (widget.showProgressIndicator) progressIndicator,
        ],
      );
    }
  }

  Widget _buildProgressIndicator() {
    return SegmentProgressIndicator(
      segments: widget.pages.length,
      currentStepIndex: widget.currentPageIndex,
      autoplay: widget.segmentProgressIndicator.autoplay,
      autoplayDuration: widget.segmentProgressIndicator.autoplayDuration,
      type: widget.segmentProgressIndicator.type,
      height: widget.segmentProgressIndicator.height,
      spacing: widget.segmentProgressIndicator.spacing,
      padding: widget.segmentProgressIndicator.padding,
      showLabels: widget.segmentProgressIndicator.showLabels,
      labels: widget.segmentProgressIndicator.labels,
      caption: widget.segmentProgressIndicator.caption,
      subtitle: widget.segmentProgressIndicator.subtitle,
      onSegmentChanged: _changePage,
    );
  }

  Widget _buildPageContent() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _handlePageChanged,
      itemCount: widget.pages.length,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(index),
            child: widget.pages[index],
          ),
        );
      },
    );
  }
}
