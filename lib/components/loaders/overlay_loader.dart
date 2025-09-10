// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/button.dart';
import 'package:iman_uikit/components/indicators/rounded_progress_indicator.dart';
import 'package:iman_uikit/components/loaders/loading_indicator.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class OverlayLoader extends StatelessWidget {
  const OverlayLoader({
    this.title,
    this.description,
    //
    this.progress,
    this.progressColor,
    this.progressBackgroundColor,
    //
    this.buttonText,
    this.onButtonTap,
    this.buttonIconStart,
    this.buttonType,
    //
    this.content,
    super.key,
  });

  final String? title;
  final String? description;

  final double? progress;
  final Color? progressColor;
  final Color? progressBackgroundColor;

  final String? buttonText;
  final VoidCallback? onButtonTap;
  final Widget? buttonIconStart;
  final ButtonType? buttonType;

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        progress == null
            ? LoadingIndicator(
                size: 96,
                strokeWidth: 8,
                color: context.borderColors.success,
              )
            : RoundedProgressIndicator(
                percent: progress!,
                progressColor: progressColor,
                backgroundColor: progressBackgroundColor,
              ),
        if (title != null) ...[
          const SizedBox(height: 24),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: context.titleTextStyle.title1,
          ),
        ],
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            textAlign: TextAlign.center,
            style: context.baseTextStyle.base1,
          ),
        ],
        if (buttonText != null) ...[
          const SizedBox(height: 24),
          Button(
            text: buttonText!,
            onTap: onButtonTap,
            iconStart: buttonIconStart,
            type: buttonType ?? ButtonType.primary,
          ),
        ],
        if (content != null) ...[
          const SizedBox(height: 24),
          content!,
        ],
      ],
    );
  }
}
