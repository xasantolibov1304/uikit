// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/inputs/input_field.dart';
import 'package:uikit/gen/assets.gen.dart';

class DoubleParameterInputField extends StatelessWidget {
  const DoubleParameterInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    this.suffixLabel,
    this.suffixValue,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.status = InputFieldStatus.info,
    //
    this.focusNode,
    //
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    //
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.isRequired = true,
    this.isLoading = false,
    this.canClear = true,
    //
    this.inputFormatters,
    //
    this.leadingIcon,
    //
    this.onSelectTap,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final String? suffixLabel;
  final String? suffixValue;
  final TextEditingController? controller;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldStatus status;

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool isRequired;
  final bool isLoading;
  final bool canClear;

  final FocusNode? focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? inputFormatters;

  final Widget? leadingIcon;

  final VoidCallback? onSelectTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      status: status,
      hintText: hintText,
      readonly: readonly,
      canClear: canClear,
      isLoading: isLoading,
      isEnabled: isEnabled,
      autofocus: autofocus,
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      controller: controller,
      isRequired: isRequired,
      captionText: captionText,
      leadingIcon: leadingIcon,
      suffixLabel: suffixLabel,
      suffixValue: suffixValue,
      initialValue: initialValue,
      keyboardType: keyboardType,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      captionHelperText: captionHelperText,
      textCapitalization: textCapitalization,
      trailingIcon: onSelectTap != null
          ? CommonGestureDetector(
              onTap: onSelectTap,
              child: UikitAssets.icons24.chevronDown.svg(),
            )
          : null,
    );
  }
}
