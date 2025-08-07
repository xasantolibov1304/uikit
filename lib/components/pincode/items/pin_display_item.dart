// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class PinDisplayItem extends StatelessWidget {
  const PinDisplayItem({
    required this.pinLength,
    required this.activeIndex,
    this.errorMessage,
    this.dotSize = 12.0,
    this.spacing = 20.0,
    super.key,
  });

  final int pinLength;
  final int activeIndex;

  final String? errorMessage;

  final double dotSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pinLength,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < pinLength - 1 ? spacing : 0,
              ),
              child: _buildDot(context, index),
            ),
          ),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            errorMessage!,
            style: context.subtitleTextStyle.medium2.copyWith(
              color: context.textColors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDot(BuildContext context, int index) {
    final isFilled = index < activeIndex;
    Color dotColor = context.borderColors.primary;

    if (errorMessage != null) {
      dotColor = context.borderColors.error;
    } else if (pinLength == activeIndex) {
      dotColor = context.borderColors.success;
    } else if (isFilled) {
      dotColor = context.borderColors.black;
    } else {
      dotColor = context.borderColors.primary;
    }

    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
