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
  late int _currentPage;
  Timer? _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );

    if (widget.autoplay) {
      _autoplayTimer = Timer.periodic(
        widget.autoplayInterval,
        (_) => _autoPlay(),
      );
    }
  }

  void _autoPlay() {
    if (!mounted || !widget.autoplay) return;
    final nextPage = (_currentPage + 1) % widget.children.length;
    _pageController.animateToPage(
      nextPage,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );
    _currentPage = nextPage;
    updateState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.children.isNotEmpty) ...[
          SizedBox(
            height: widget.children.first.height,
            child: PageView.builder(
              padEnds: false,
              controller: _pageController,
              itemCount: widget.children.length,
              onPageChanged: (index) {
                _currentPage = index;
                updateState();
              },
              itemBuilder: (_, index) {
                final isLast = index == widget.children.length - 1;
                return Padding(
                    padding:
                        EdgeInsets.only(right: isLast ? 0 : widget.spacing),
                    child: widget.children[index]);
              },
            ),
          ),
        ],
        if (widget.showIndicator) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.children.length,
              (index) {
                final isActive = index == _currentPage;
                return AnimatedContainer(
                  width: _indicatorSize,
                  height: _indicatorSize,
                  duration: _animationDuration,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? context.textColors.secondary
                        : context.textColors.muted,
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
