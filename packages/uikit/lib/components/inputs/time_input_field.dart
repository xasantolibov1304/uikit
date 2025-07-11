// Flutter imports:
import 'package:flutter/material.dart';
import 'package:iman_uikit/common/bottom_sheets/bottom_sheet.dart';
import 'package:iman_uikit/common/bottom_sheets/date_picker/time_picker.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/utils/date/date_format_constants.dart';
import 'package:iman_uikit/utils/date/date_formatter.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
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
    this.selectTimeButtonText,
    this.onChanged,
    this.validator,
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

  final String? selectTimeButtonText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return InputField(
      key: ValueKey(initialValue),
      label: label,
      status: status,
      readonly: readonly,
      canClear: canClear,
      autofocus: autofocus,
      isLoading: isLoading,
      isEnabled: isEnabled,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      isRequired: isRequired,
      captionText: captionText,
      initialValue: initialValue,
      captionIconPath: captionIconPath,
      textInputAction: textInputAction,
      keyboardType: TextInputType.datetime,
      captionHelperText: captionHelperText,
      hintText: hintText ?? hhmm.toLowerCase(),
      trailingIcon: selectTimeButtonText != null
          ? CommonGestureDetector(
              onTap: () => CustomBottomSheet.showStaticBottomSheet(
                context,
                child: TimePickerSheet(
                  buttonText: selectTimeButtonText!,
                  onTimeSelected: (time) =>
                      onChanged?.call(DateFormatterHelper.fHHmm(time)),
                ),
              ),
              child: UikitAssets.icons24.clock.svg(),
            )
          : null,
      inputFormatters: [DateTextFormatter(formatPattern: hhmm)],
    );
  }
}
