// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';


class InfoField extends StatelessWidget {
  const InfoField({
    required this.label,
    required this.value,
    this.captionText,
    this.suffixValue,
    this.suffixValueThrough,
    this.leftIcon,
    this.trailingIcon,
    super.key,
  });

  final String label;
  final String value;
  final String? suffixValue;

  final String? suffixValueThrough;

  final String? captionText;

  final Widget? leftIcon;

  final Widget? trailingIcon;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColors.primary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.baseTextStyle.base4.copyWith(
                    color: context.textColors.tertiary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leftIcon != null) ...[
                      leftIcon!,
                      const SizedBox(width: 4),
                    ],
                    Text(
                      value,
                      style: context.titleTextStyle.title3.copyWith(
                        color: context.textColors.primary,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: context.textColors.tertiary,
                      ),
                    ),
                    if (suffixValue != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        suffixValue!,
                        style: context.baseTextStyle.base1.copyWith(
                          color: context.textColors.tertiary,
                        ),
                      ),
                    ],
                    if (suffixValueThrough != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        suffixValueThrough!,
                        style: context.baseTextStyle.base1.copyWith(
                          color: context.textColors.tertiary,
                        ),
                      ),
                    ],
                  ],
                ),
                if (captionText != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    captionText!,
                    style: context.baseTextStyle.base4.copyWith(
                      color: context.textColors.tertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 9),
            trailingIcon!,
            const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}
