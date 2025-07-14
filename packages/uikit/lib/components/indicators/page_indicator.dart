import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _pageIndicatorSize = 10.0;
const _animationDuration = Duration(milliseconds: 300);

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.currentPage,
    required this.totalPages,
    super.key,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < totalPages; i++)
          AnimatedContainer(
            curve: Curves.easeInOut,
            width: _pageIndicatorSize,
            height: _pageIndicatorSize,
            duration: _animationDuration,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.borderColors.secondary,
            ),
            margin: EdgeInsets.symmetric(horizontal: 6),
          ),
      ],
    );
  }
}
