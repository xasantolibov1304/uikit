import 'package:flutter/material.dart';
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/amount_input_field.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CurrencyInputField extends StatelessWidget {
  const CurrencyInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    //
    this.decimalPlaces = 0,
    this.currency,
    this.currencyStyle,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.status = InputFieldStatus.info,
    //
    this.focusNode,
    //
    this.textInputAction = TextInputAction.done,
    //
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = true,
    this.canClear = true,
    //
    this.onSelectCurrencyTap,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;

  final int decimalPlaces;
  final String? currency;
  final TextStyle? currencyStyle;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldStatus status;

  final FocusNode? focusNode;
  final TextInputAction textInputAction;

  final bool isLoading;
  final bool isEnabled;
  final bool autofocus;
  final bool readonly;
  final bool isRequired;
  final bool canClear;

  final VoidCallback? onSelectCurrencyTap;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return AmountInputField(
      label: label,
      hintText: hintText,
      currency: currency,
      initialValue: initialValue,
      decimalPlaces: decimalPlaces,
      currencyStyle: currencyStyle,
      trailingIcon: onSelectCurrencyTap != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1,
                  height: 24,
                  decoration: BoxDecoration(
                    color: context.textColors.muted,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.textColors.muted,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  (currency ?? '').trim(),
                  style: context.titleTextStyle.main1,
                ),
                const SizedBox(width: 6),
                CommonGestureDetector(
                  onTap: onSelectCurrencyTap,
                  child: UikitAssets.icons24.arrowDown.svg(),
                ),
              ],
            )
          : null,
    );
  }
}
