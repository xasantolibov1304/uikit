// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:percent_indicator/percent_indicator.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class RoundedProgressIndicator extends StatelessWidget {
  const RoundedProgressIndicator({
    required this.percent,
    this.size = 96.0,
    this.lineWidth = 8.0,
    this.backgroundColor,
    this.progressColor,
    this.textStyle,
    this.showPercentage = true,
    super.key,
  });

  final double percent;
  final double size;
  final double lineWidth;

  final TextStyle? textStyle;

  final bool showPercentage;

  final Color? backgroundColor;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      radius: size / 2,
      lineWidth: lineWidth,
      animateToInitialPercent: false,
      percent: percent.clamp(0.0, 1.0),
      circularStrokeCap: CircularStrokeCap.round,
      center: showPercentage
          ? Text(
              '${(percent * 100).toInt()}%',
              textAlign: TextAlign.center,
              style: textStyle ??
                  context.displayTextStyle.display1.copyWith(
                    color: context.textColors.success,
                  ),
            )
          : null,
      progressColor: progressColor ?? context.surfaceColors.success,
      backgroundColor: backgroundColor ?? context.borderColors.muted,
    );
  }
}
