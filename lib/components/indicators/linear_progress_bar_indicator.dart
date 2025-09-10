// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/indicators/common_linear_progress_indicator.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class LinearProgressBarIndicator extends StatelessWidget {
  const LinearProgressBarIndicator({
    required this.percent,
    this.caption,
    this.subtitle,
    this.additionalCaption,
    this.additionalSubtitle,
    this.type = LinearProgressIndicatorType.success,
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
          CommonLinearProgressIndicator(
            type: type,
            percent: percent,
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
                        style: context.baseTextStyle.base2.copyWith(
                          color: _textColors(context),
                        ),
                      ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: context.baseTextStyle.base3.copyWith(
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
                      style: context.baseTextStyle.base2,
                    ),
                  if (additionalSubtitle != null)
                    Text(
                      additionalSubtitle!,
                      style: context.baseTextStyle.base3,
                    ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _textColors(BuildContext context) {
    switch (type) {
      case LinearProgressIndicatorType.neutral:
        return context.textColors.primary;
      case LinearProgressIndicatorType.warning:
        return context.textColors.warning;
      case LinearProgressIndicatorType.error:
        return context.textColors.error;
      case LinearProgressIndicatorType.success:
        return context.textColors.success;
    }
  }
}
