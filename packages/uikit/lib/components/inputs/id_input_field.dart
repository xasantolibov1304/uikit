import 'package:flutter/material.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class IdInputField extends StatelessWidget {
  const IdInputField({
    this.label,
    this.hintText,
    this.controller,
    this.initialValue,
    this.suffixLabel,
    this.suffixValue,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.status = InputFieldStatus.info,
    //
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.isRequired = false,
    this.isLoading = false,
    //
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    //
    this.onScanTap,
    required this.onChanged,
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

  final FocusNode? focusNode;
  final TextInputAction textInputAction;

  final VoidCallback? onScanTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      status: status,
      hintText: hintText,
      readonly: readonly,
      isLoading: isLoading,
      isEnabled: isEnabled,
      autofocus: autofocus,
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      isRequired: isRequired,
      captionText: captionText,
      initialValue: initialValue,
      trailingIcon: onScanTap != null
          ? MyGestureDetector(
              onTap: onScanTap,
              child: UikitAssets.icons24.scan.svg(),
            )
          : null,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      captionHelperText: captionHelperText,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.characters,
    );
  }
}
