// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _height = 86.0;

enum InfoFieldSize {
  small,
  medium,
  large,
  extraLarge,
}

class InfoField extends StatelessWidget {
  const InfoField({
    required this.label,
    required this.value,
    this.captionText,
    this.suffixValue,
    this.valueThrough,
    this.suffixValueThrough,
    this.leftIcon,
    this.rightIcon,
    this.trailingIcon,
    this.isEnabled = true,
    this.size = InfoFieldSize.small,
    super.key,
  });

  final String label;
  final String value;
  final String? suffixValue;

  final String? valueThrough;
  final String? suffixValueThrough;

  final String? captionText;

  final Widget? leftIcon;
  final Widget? rightIcon;

  final Widget? trailingIcon;

  final bool isEnabled;

  final InfoFieldSize size;

  @override
  Widget build(BuildContext context) {
    final canShowIcon = size != InfoFieldSize.extraLarge;

    return Container(
      height: _height,
      decoration: BoxDecoration(
        color: isEnabled
            ? context.fieldColors.background
            : context.fieldColors.backgroundDisabled,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEnabled
              ? context.fieldColors.border
              : context.fieldColors.borderDisabled,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.labelTextStyle.main.copyWith(
                    color: context.textColors.tertiary,
                  ),
                ),
                Row(
                  children: [
                    if (leftIcon != null && canShowIcon) ...[
                      leftIcon!,
                      const SizedBox(width: 4),
                    ],
                    if (suffixValue != null) ...[
                      Text(
                        suffixValue!,
                        style: _getStyle(context).copyWith(
                          color: context.textColors.tertiary,
                        ),
                      ),
                    ],
                    if (valueThrough != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        valueThrough!,
                        style: _getStyle(context).copyWith(
                          color: context.textColors.tertiary,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: context.textColors.tertiary,
                        ),
                      ),
                    ],
                    if (suffixValueThrough != null) ...[
                      const SizedBox(width: 2),
                      Text(
                        suffixValueThrough!,
                        style: _getStyle(context).copyWith(
                          color: context.textColors.tertiary,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: context.textColors.tertiary,
                        ),
                      ),
                    ],
                    if (rightIcon != null && canShowIcon) ...[
                      const SizedBox(width: 4),
                      rightIcon!,
                    ],
                  ],
                ),
                if (captionText != null) ...[
                  Text(
                    captionText!,
                    style: context.subtitleTextStyle.compact1.copyWith(
                      color: context.textColors.tertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 4),
            trailingIcon!,
          ],
        ],
      ),
    );
  }

  TextStyle _getStyle(BuildContext context) {
    switch (size) {
      case InfoFieldSize.small:
        return context.titleTextStyle.compact1;
      case InfoFieldSize.medium:
        return context.titleTextStyle.medium1;
      case InfoFieldSize.large:
        return context.titleTextStyle.large1;
      case InfoFieldSize.extraLarge:
        return context.titleTextStyle.extraLarge;
    }
  }
}
