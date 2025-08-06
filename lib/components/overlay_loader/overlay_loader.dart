// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/loaders/loading_indicator.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import '../buttons/button.dart';

class OverlayLoader extends StatelessWidget {
  const OverlayLoader({
    required this.title,
    required this.description,
    this.buttonText,
    this.onButtonTap,
    super.key,
  });

  final String title;
  final String description;

  final String? buttonText;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingIndicator(
          size: 96,
          strokeWidth: 8,
          color: context.borderColors.success,
        ),
        const SizedBox(height: 24),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.titleTextStyle.large2,
        ),
        const SizedBox(height: 4),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.bodyTextStyle.medium2,
        ),
        if (buttonText != null) ...[
          const SizedBox(height: 24),
          Button(
            text: buttonText!,
            onTap: onButtonTap,
          ),
        ],
      ],
    );
  }
}
