import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum LinearProgressIndicatorType {
  neutral,
  warning,
  error,
}

class LinearProgressIndicator extends StatelessWidget {
  const LinearProgressIndicator({
    required this.percent,
    this.caption,
    this.subtitle,
    this.additionalCaption,
    this.additionalSubtitle,
    this.type = LinearProgressIndicatorType.neutral,
    super.key,
  });

  final double percent;

  final String? caption;
  final String? subtitle;

  final String? additionalCaption;
  final String? additionalSubtitle;

  final LinearProgressIndicatorType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearPercentIndicator(
            lineHeight: 4,
            animation: true,
            percent: percent,
            padding: EdgeInsets.zero,
            barRadius: Radius.circular(4),
            progressColor: _progressColor(context),
            backgroundColor: context.borderColors.primary,
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (caption != null)
                      Text(
                        caption!,
                        style: context.bodyTextStyle.main.copyWith(
                          color: _textColors(context),
                        ),
                      ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: context.bodyTextStyle.main.copyWith(
                          color: _textColors(context),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (additionalCaption != null)
                    Text(
                      additionalCaption!,
                      style: context.bodyTextStyle.main,
                    ),
                  if (additionalSubtitle != null)
                    Text(
                      additionalSubtitle!,
                      style: context.bodyTextStyle.main,
                    ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _progressColor(BuildContext context) {
    switch (type) {
      case LinearProgressIndicatorType.neutral:
        return context.borderColors.success;
      case LinearProgressIndicatorType.warning:
        return context.borderColors.warning;
      case LinearProgressIndicatorType.error:
        return context.borderColors.error;
    }
  }

  Color _textColors(BuildContext context) {
    switch (type) {
      case LinearProgressIndicatorType.neutral:
        return context.textColors.primary;
      case LinearProgressIndicatorType.warning:
        return context.textColors.warning;
      case LinearProgressIndicatorType.error:
        return context.textColors.error;
    }
  }
}
