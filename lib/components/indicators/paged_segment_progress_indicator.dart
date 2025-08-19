// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _indicatorHeight = 4.0;

enum ProgressIndicatorPosition {
  top,
  bottom,
}

class PagedSegmentProgressIndicator extends StatefulWidget {
  const PagedSegmentProgressIndicator({
    required this.pages,
    required this.onPageChanged,
    this.currentPageIndex,
    this.progressIndicatorPosition = ProgressIndicatorPosition.top,
    this.showProgressIndicator = true,
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 3),
    this.onComplete,
    super.key,
  });

  /// List of page widgets to display
  final List<Widget> pages;

  /// Current page index (0-based)
  final int? currentPageIndex;

  /// Callback when page changes
  final ValueChanged<int> onPageChanged;

  /// Position of the progress indicator
  final ProgressIndicatorPosition progressIndicatorPosition;

  /// Whether to show the progress indicator
  final bool showProgressIndicator;

  /// Whether to autoplay through pages
  final bool autoplay;

  /// Duration for each page when autoplay is enabled
  final Duration autoplayDuration;

  /// Callback when all pages are completed
  final VoidCallback? onComplete;

  @override
  State<PagedSegmentProgressIndicator> createState() =>
      _PagedSegmentProgressIndicatorState();
}

class _PagedSegmentProgressIndicatorState
    extends State<PagedSegmentProgressIndicator> with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _timerController;
  late Animation<double> _timerAnimation;
  int _currentPageIndex = 0;
  bool _isTimerPaused = false;
  bool _isTimerRunning = false;

  Timer? _tapTimer;
  bool _isHold = false;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.currentPageIndex ?? 0;
    _pageController = PageController(initialPage: _currentPageIndex);

    _timerController = AnimationController(
      duration: widget.autoplayDuration,
      vsync: this,
    );

    _timerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_timerController);

    if (widget.autoplay) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(PagedSegmentProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPageIndex != widget.currentPageIndex) {
      _currentPageIndex = widget.currentPageIndex ?? 0;
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _resetTimer();
    }

    if (oldWidget.autoplayDuration != widget.autoplayDuration) {
      _timerController.duration = widget.autoplayDuration;
      _resetTimer();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timerController.dispose();
    _tapTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (widget.autoplay && !_isTimerPaused) {
      _isTimerRunning = true;
      _timerController.forward().then((_) {
        if (_isTimerRunning && !_isTimerPaused) {
          _nextPage();
        }
      });
    }
  }

  void _resetTimer() {
    _timerController.reset();
    if (widget.autoplay && !_isTimerPaused) {
      _startTimer();
    }
  }

  void _pauseTimer() {
    _isTimerPaused = true;
    _timerController.stop();
  }

  void _resumeTimer() {
    _isTimerPaused = false;
    if (widget.autoplay) {
      _startTimer();
    }
  }

  void _nextPage() {
    if (_currentPageIndex < widget.pages.length - 1) {
      _changePage(_currentPageIndex + 1);
    } else {
      widget.onComplete?.call();
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _changePage(_currentPageIndex - 1);
    }
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
      _resetTimer();
    }
  }

  void _handlePageChanged(int pageIndex) {
    if (pageIndex != _currentPageIndex &&
        pageIndex >= 0 &&
        pageIndex < widget.pages.length) {
      _currentPageIndex = pageIndex;
      widget.onPageChanged(pageIndex);
      _resetTimer();
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: List.generate(
          widget.pages.length,
          (index) {
            final isCurrentPage = index == _currentPageIndex;
            final isCompleted = index < _currentPageIndex;

            return Expanded(
              child: Container(
                height: _indicatorHeight,
                margin: EdgeInsets.only(
                  right: index < widget.pages.length - 1 ? 8 : 0,
                ),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? const Color(0xFF222222)
                      : context.borderColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: isCurrentPage
                    ? AnimatedBuilder(
                        animation: _timerAnimation,
                        builder: (context, child) {
                          return FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: _timerAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF222222),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          );
                        },
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    return Stack(
      children: [
        PageView.builder(
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
        ),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (_) {
                    _pauseTimer();
                    _isHold = false;
                    _tapTimer?.cancel();
                    _tapTimer = Timer(const Duration(milliseconds: 200), () {
                      _isHold = true;
                    });
                  },
                  onTapUp: (_) {
                    _tapTimer?.cancel();
                    _resumeTimer();
                    if (!_isHold) {
                      _previousPage();
                    }
                  },
                  onTapCancel: () {
                    _tapTimer?.cancel();
                    _resumeTimer();
                  },
                  child: Container(),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (_) {
                    _pauseTimer();
                    _isHold = false;
                    _tapTimer?.cancel();
                    _tapTimer = Timer(const Duration(milliseconds: 200), () {
                      _isHold = true;
                    });
                  },
                  onTapUp: (_) {
                    _tapTimer?.cancel();
                    _resumeTimer();
                    if (!_isHold) {
                      _nextPage();
                    }
                  },
                  onTapCancel: () {
                    _tapTimer?.cancel();
                    _resumeTimer();
                  },
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
