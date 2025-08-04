// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
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
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    //
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = false,
    this.canClear = true,
    //
    this.inputFormatters,
    //
    this.trailingIcon,
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

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? inputFormatters;

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
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      status: status,
      readonly: readonly,
      hintText: hintText,
      canClear: canClear,
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
      size: InputFieldSize.small,
      captionIconPath: captionIconPath,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      captionHelperText: captionHelperText,
      textCapitalization: textCapitalization,
      leadingIcon: UikitAssets.icons24.search.svg(),
    );
  }
}
