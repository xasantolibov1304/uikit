// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/inputs/input_field.dart';
import 'package:uikit/gen/assets.gen.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    this.label,
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
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.isRequired = true,
    this.canClear = true,
    this.isLoading = false,
    //
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;

  final InputFieldStatus status;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool isRequired;
  final bool canClear;
  final bool isLoading;

  final FocusNode? focusNode;
  final TextInputAction textInputAction;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isVisible = false;

  void _toggleVisibility() {
    _isVisible = !_isVisible;
    _updateState();
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: widget.label,
      status: widget.status,
      obscureText: !_isVisible,
      hintText: widget.hintText,
      readonly: widget.readonly,
      canClear: widget.canClear,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      autofocus: widget.autofocus,
      validator: widget.validator,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      isRequired: widget.isRequired,
      captionText: widget.captionText,
      initialValue: widget.initialValue,
      trailingIcon: CommonGestureDetector(
        onTap: _toggleVisibility,
        child: _isVisible
            ? UikitAssets.icons24.eye.svg()
            : UikitAssets.icons24.eyeSlash.svg(),
      ),
      captionIconPath: widget.captionIconPath,
      textInputAction: widget.textInputAction,
      captionHelperText: widget.captionHelperText,
      textCapitalization: TextCapitalization.characters,
      keyboardType:
          _isVisible ? TextInputType.visiblePassword : TextInputType.text,
    );
  }
}
