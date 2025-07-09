// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/input_field.dart';

class ExpireDateTextField extends StatelessWidget {
  const ExpireDateTextField({
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
    this.isRequired = true,
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
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      isRequired: isRequired,
      initialValue: initialValue,
      textInputAction: textInputAction,
      keyboardType: TextInputType.datetime,
      inputFormatters: [CreditCardExpirationDateFormatter()],
    );
  }
}
