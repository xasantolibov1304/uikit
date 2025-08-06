// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:percent_indicator/percent_indicator.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';

enum LinearProgressIndicatorType {
  neutral,
  success,
  warning,
  error,
}

class CommonLinearProgressIndicator extends StatelessWidget {
  const CommonLinearProgressIndicator({
    required this.percent,
    this.type = LinearProgressIndicatorType.success,
    super.key,
  });

  final double percent;

  final LinearProgressIndicatorType type;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 4,
      animation: true,
      percent: percent,
      padding: EdgeInsets.zero,
      barRadius: Radius.circular(4),
      progressColor: _progressColor(context),
      backgroundColor: context.borderColors.primary,
    );
  }

  Color _progressColor(BuildContext context) {
    switch (type) {
      case LinearProgressIndicatorType.neutral:
        return context.borderColors.primary;
      case LinearProgressIndicatorType.success:
        return context.borderColors.success;
      case LinearProgressIndicatorType.warning:
        return context.borderColors.warning;
      case LinearProgressIndicatorType.error:
        return context.borderColors.error;
    }
  }
}
