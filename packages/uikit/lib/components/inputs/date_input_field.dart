import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class DateInputField extends StatelessWidget {
  const DateInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.status = InputFieldStatus.info,
    //
    this.onSelectDateTap,
    this.onChanged,
    this.validator,
    //
    this.focusNode,
    //
    this.textInputAction = TextInputAction.done,
    //
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = false,
    this.canClear = true,
    //
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;

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

  final VoidCallback? onSelectDateTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      hintText: hintText,
      readonly: readonly,
      canClear: canClear,
      isLoading: isLoading,
      isEnabled: isEnabled,
      autofocus: autofocus,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      isRequired: isRequired,
      initialValue: initialValue,
      textInputAction: textInputAction,
      keyboardType: TextInputType.datetime,
      trailingIcon: onSelectDateTap != null
          ? MyGestureDetector(
              onTap: onSelectDateTap,
              child: UikitAssets.icons24.calendar.svg(),
            )
          : null,
      inputFormatters: [MaskedInputFormatter('##.##.####')],
    );
  }
}
