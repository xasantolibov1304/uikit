// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:uikit/components/inputs/input_field.dart';

class AreaInputField extends StatefulWidget {
  const AreaInputField({
    required this.label,
    required this.minLines,
    required this.maxLines,
    this.maxLength,
    this.showCounter = false,
    this.hintText,
    this.initialValue,
    this.controller,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.size = InputFieldSize.large,
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

  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool showCounter;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldSize size;
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
  State<AreaInputField> createState() => _AreaInputFieldState();
}

class _AreaInputFieldState extends State<AreaInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      size: widget.size,
      label: widget.label,
      status: widget.status,
      controller: _controller,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      readonly: widget.readonly,
      hintText: widget.hintText,
      canClear: widget.canClear,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      validator: widget.validator,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      isRequired: widget.isRequired,
      captionText: widget.captionText,
      showCounter: widget.showCounter,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      trailingIcon: widget.trailingIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      captionIconPath: widget.captionIconPath,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      captionHelperText: widget.captionHelperText,
      textCapitalization: widget.textCapitalization,
      iconsCrossAxisAlignment: CrossAxisAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }
}
