// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/amount_input_field.dart';
import 'package:iman_uikit/components/inputs/controllers/stylable_input_field_controller.dart';
import 'package:iman_uikit/components/inputs/controllers/text_part_style_definition.dart';
import 'package:iman_uikit/components/inputs/controllers/text_style_matcher.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/components/sliders/input_slider.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/utils/reg_exp_constants.dart';

class SliderInputField extends StatefulWidget {
  const SliderInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    //
    this.decimalPlaces = 0,
    this.currency,
    this.currencyStyle,
    //
    this.sliderDivisions = 10,
    this.minValue = 0,
    this.maxValue = 100,
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

  final int sliderDivisions;
  final double minValue;
  final double maxValue;

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
  State<SliderInputField> createState() => _SliderInputFieldState();
}

class _SliderInputFieldState extends State<SliderInputField> {
  late StylableInputFieldController _sliderController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sliderController = StylableInputFieldController(
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
    _sliderController
        .setText(widget.initialValue ?? widget.minValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return InputSlider(
      max: widget.maxValue,
      min: widget.minValue,
      divisions: widget.sliderDivisions,
      onChanged: (value) {
        if (value > widget.maxValue) {
          widget.onChanged?.call(widget.maxValue.toString());
          _sliderController.setText(widget.maxValue.toString());
        } else {
          widget.onChanged?.call(value.toString());
          _sliderController.setText(value.toString());
        }
      },
      value: double.parse(widget.initialValue ?? widget.minValue.toString()),
      child: AmountInputField(
        label: widget.label,
        status: widget.status,
        hintText: widget.hintText,
        currency: widget.currency,
        readonly: widget.readonly,
        canClear: widget.canClear,
        isLoading: widget.isLoading,
        isEnabled: widget.isEnabled,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        captionText: widget.captionText,
        initialValue: widget.initialValue,
        decimalPlaces: widget.decimalPlaces,
        currencyStyle: widget.currencyStyle,
        captionIconPath: widget.captionIconPath,
        captionHelperText: widget.captionHelperText,
        trailingIcon: widget.trailingIcon,
      ),
    );
  }
}
