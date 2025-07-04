import 'package:flutter/material.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class IdInputField extends StatelessWidget {
  const IdInputField({
    required this.label,
    this.hintText,
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    this.status = InputFieldStatus.info,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = false,
    this.onScanTap,
    super.key,
  });

  final String? label;
  final String? hintText;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldStatus status;

  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  final TextInputAction textInputAction;

  final bool isLoading;
  final bool isEnabled;
  final bool autofocus;
  final bool readonly;
  final bool isRequired;

  final VoidCallback? onScanTap;

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
