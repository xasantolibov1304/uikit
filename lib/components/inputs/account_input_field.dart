// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:uikit/components/inputs/input_field.dart';

class AccountInputField extends StatelessWidget {
  const AccountInputField({
    required this.label,
    this.hintText,
    this.controller,
    this.initialValue,
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
    this.onChanged,
    this.validator,
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

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool isRequired;
  final bool isLoading;
  final bool canClear;

  final FocusNode? focusNode;
  final TextInputAction textInputAction;

  final List<TextInputFormatter>? inputFormatters;

  final Widget? leadingIcon;

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
      initialValue: initialValue,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      captionHelperText: captionHelperText,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.characters,
    );
  }
}
