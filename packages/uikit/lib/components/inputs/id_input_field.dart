// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class IdInputField extends StatelessWidget {
  const IdInputField({
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
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.isRequired = true,
    this.isLoading = false,
    this.canClear = true,
    //
    this.focusNode,
    //
    this.textInputAction = TextInputAction.done,
    //
    this.onScanTap,
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
      initialValue: initialValue,
      trailingIcon: onScanTap != null
          ? CommonGestureDetector(
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
