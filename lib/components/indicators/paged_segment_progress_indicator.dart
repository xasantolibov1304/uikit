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

  /// Segment progress indicator
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPageIndex);
  }

  @override
  void didUpdateWidget(PagedSegmentProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPageIndex != widget.currentPageIndex) {
      _pageController.animateToPage(
        widget.currentPageIndex,
        duration: widget.segmentProgressIndicator.duration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
    return Padding(
      padding: widget.segmentProgressIndicator.padding,
      child: widget.segmentProgressIndicator,
    );
  }

  Widget _buildPageContent() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        widget.onPageChanged(index);
      },
      itemCount: widget.pages.length,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: widget.segmentProgressIndicator.animate
              ? widget.segmentProgressIndicator.duration
              : Duration.zero,
          child: Container(
            key: ValueKey(index),
            child: widget.pages[index],
          ),
        );
      },
    );
  }
}
