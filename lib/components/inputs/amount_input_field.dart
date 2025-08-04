// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/controllers/stylable_input_field_controller.dart';
import 'package:iman_uikit/components/inputs/controllers/text_part_style_definition.dart';
import 'package:iman_uikit/components/inputs/controllers/text_style_matcher.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/utils/reg_exp_constants.dart';

const _maxLength = 10;

class AmountInputField extends StatefulWidget {
  const AmountInputField({
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
    this.trailingIcon,
    //
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

  final Widget? trailingIcon;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<AmountInputField> createState() => _AmountInputFieldState();
}

class _AmountInputFieldState extends State<AmountInputField> {
  StylableInputFieldController get _amountController =>
      StylableInputFieldController(
        styles: TextStyleMatcher(
          definitionList: <TextPartStyleDefinition>[
            TextPartStyleDefinition(
              pattern: CommonRegExps.onlyDigits.pattern,
              style: context.titleTextStyle.main1,
            ),
            TextPartStyleDefinition(
              pattern: widget.currency ?? '',
              style: widget.currencyStyle ??
                  context.bodyTextStyle.compact2.copyWith(
                    color: context.textColors.muted,
                  ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: widget.label,
      status: widget.status,
      readonly: widget.readonly,
      canClear: widget.canClear,
      hintText: widget.hintText,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      validator: widget.validator,
      focusNode: widget.focusNode,
      controller: _amountController,
      isRequired: widget.isRequired,
      captionText: widget.captionText,
      initialValue: widget.initialValue,
      trailingIcon: widget.trailingIcon,
      captionIconPath: widget.captionIconPath,
      textInputAction: widget.textInputAction,
      captionHelperText: widget.captionHelperText,
      keyboardType: TextInputType.visiblePassword,
      inputFormatters: [
        CurrencyInputFormatter(
          mantissaLength: widget.decimalPlaces,
          trailingSymbol: widget.currency ?? '',
          thousandSeparator: ThousandSeparator.Space,
        ),
      ],
      maxLength: _maxLength + (widget.currency?.length ?? 0),
    );
  }
}
