// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/inputs/input_field.dart';
import 'package:uikit/gen/assets.gen.dart';
import 'package:uikit/utils/utils.dart';

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
    this.onSelectDateTap,
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
      status: status,
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
      captionText: captionText,
      initialValue: initialValue,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      captionHelperText: captionHelperText,
      keyboardType: TextInputType.datetime,
      inputFormatters: [DateTextFormatter()],
      trailingIcon: onSelectDateTap != null
          ? CommonGestureDetector(
              onTap: onSelectDateTap,
              child: UikitAssets.icons24.calendar.svg(),
            )
          : null,
      hintText: hintText ?? ddMMyyyyDot.toLowerCase(),
    );
  }
}
