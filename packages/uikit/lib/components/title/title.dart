// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/button.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum TitleWidgetSize {
  small,
  medium,
  large,
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    this.title,
    this.subtitle,
    this.size = TitleWidgetSize.large,
    //
    this.trailingIcon,
    //
    this.buttonText,
    this.onButtonTap,
    this.buttonType = ButtonType.secondary,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final TitleWidgetSize size;

  final Widget? trailingIcon;

  final String? buttonText;
  final VoidCallback? onButtonTap;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    final isSmall = size == TitleWidgetSize.small;

    return Container(
      decoration: BoxDecoration(
        color: context.backgroundColors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(
        top: 8,
        right: 8,
        left: 16,
        bottom: 8,
      ),
      child: Row(
        crossAxisAlignment: title == null || subtitle == null
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title ?? '',
                    style: _getTitleStyle(context),
                  ),
                if (title != null && subtitle != null)
                  const SizedBox(height: 2),
                if (subtitle != null) ...[
                  Padding(
                    padding: EdgeInsets.only(
                      top: isSmall ? 3 : 0,
                      bottom: isSmall ? 3 : 0,
                    ),
                    child: Text(
                      subtitle ?? '',
                      style: context.subtitleTextStyle.medium1.copyWith(
                        color: context.textColors.tertiary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 12),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: isSmall || title == null ? 0 : 8,
              ),
              child: trailingIcon!,
            ),
          ],
          if (buttonText != null && !isSmall) ...[
            const SizedBox(width: 12),
            Button(
              type: buttonType,
              onTap: onButtonTap,
              text: buttonText ?? '',
              size: ButtonSize.small,
            ),
          ]
        ],
      ),
    );
  }

  TextStyle _getTitleStyle(BuildContext context) {
    switch (size) {
      case TitleWidgetSize.small:
        return context.titleTextStyle.main2.bold;
      case TitleWidgetSize.medium:
        return context.titleTextStyle.medium3.bold;
      case TitleWidgetSize.large:
        return context.titleTextStyle.large2.bold;
    }
  }
}
