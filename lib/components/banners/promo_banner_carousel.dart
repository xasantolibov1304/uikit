// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'promo_banner.dart';

const _indicatorSize = 8.0;
const _animationDuration = Duration(milliseconds: 400);

class PromoBannerCarousel extends StatefulWidget {
  const PromoBannerCarousel({
    required this.children,
    this.autoplay = false,
    this.showIndicator = true,
    this.autoplayInterval = const Duration(seconds: 3),
    this.viewportFraction = 0.97,
    this.spacing = 8,
    super.key,
  });

  /// PromoBanners to display.
  final List<PromoBanner> children;

  /// Whether to autoplay the carousel.
  final bool autoplay;

  /// Whether to show the indicator.
  final bool showIndicator;

  /// The interval between autoplay.
  final Duration autoplayInterval;

  /// The fraction of the viewport that is visible.
  ///
  /// For example, if the viewport is 100 pixels wide and viewportFraction is 0.5,
  /// then half of the viewport will be visible.
  final double viewportFraction;

  /// The spacing between the banners.
  final double spacing;

  @override
  State<PromoBannerCarousel> createState() => _PromoBannerCarouselState();
}

class _PromoBannerCarouselState extends State<PromoBannerCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );
    _startAutoplay();
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  void didUpdateWidget(PromoBannerCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.autoplay != oldWidget.autoplay) {
      _handleAutoplayChange();
    }
  }

  @override
  void dispose() {
    _stopAutoplay();
    _pageController.dispose();
    super.dispose();
  }

  void _handleAutoplayChange() {
    if (widget.autoplay) {
      _startAutoplay();
    } else {
      _stopAutoplay();
    }
  }

  void _startAutoplay() {
    if (!widget.autoplay || widget.children.isEmpty) return;

    _stopAutoplay();
    _autoplayTimer = Timer.periodic(
      widget.autoplayInterval,
      (_) {
        if (!mounted || !widget.autoplay || widget.children.isEmpty) return;

        final nextPage = (_currentPage + 1) % widget.children.length;
        _pageController.animateToPage(
          nextPage,
          duration: _animationDuration,
          curve: Curves.easeInOut,
        );
      },
    );
  }

  void _stopAutoplay() {
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
  }

  void _onPageChanged(int index) {
    if (_currentPage != index) {
      _currentPage = index;
      _updateState();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) {
      return const SizedBox.shrink();
    }
    final length = widget.children.length;

    return Column(
      children: [
        SizedBox(
          height: widget.children.first.height,
          child: PageView.builder(
            padEnds: false,
            itemCount: length,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final isLast = index == length - 1;
              return Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : widget.spacing),
                child: widget.children[index],
              );
            },
          ),
        ),
        if (widget.showIndicator) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              length,
              (index) => AnimatedContainer(
                width: _indicatorSize,
                height: _indicatorSize,
                duration: _animationDuration,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentPage
                      ? context.textColors.secondary
                      : context.textColors.muted,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
