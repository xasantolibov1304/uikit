import 'package:flutter/material.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.label,
    this.hintText,
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    this.status = InputFieldStatus.info,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = false,
    this.trailingIcon,
    super.key,
  });

  final String? label;
  final String? hintText;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldStatus status;

  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final bool isLoading;
  final bool isEnabled;
  final bool autofocus;
  final bool readonly;
  final bool isRequired;

  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      status: status,
      readonly: readonly,
      hintText: hintText,
      isLoading: isLoading,
      isEnabled: isEnabled,
      autofocus: autofocus,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      isRequired: isRequired,
      controller: controller,
      captionText: captionText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      trailingIcon: trailingIcon,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      captionHelperText: captionHelperText,
      textCapitalization: textCapitalization,
    );
  }
}
