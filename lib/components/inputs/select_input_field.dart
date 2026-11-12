// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/inputs/input_field.dart';
import 'package:uikit/gen/assets.gen.dart';

class SelectInputField extends StatefulWidget {
  const SelectInputField({
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
    this.readonly = true,
    this.autofocus = false,
    this.isRequired = true,
    this.isLoading = false,
    this.canClear = false,
    //
    this.leadingIcon,
    //
    this.onSelectTap,
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

  final Widget? leadingIcon;

  final VoidCallback? onSelectTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<SelectInputField> createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  bool _isExpanded = false;

  void _handleSelectTap() {
    _isExpanded = !_isExpanded;
    _updateState();
    widget.onSelectTap?.call();
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: widget.label,
      status: widget.status,
      onTap: _handleSelectTap,
      hintText: widget.hintText,
      readonly: widget.readonly,
      canClear: widget.canClear,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      autofocus: widget.autofocus,
      validator: widget.validator,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      controller: widget.controller,
      isRequired: widget.isRequired,
      captionText: widget.captionText,
      leadingIcon: widget.leadingIcon,
      initialValue: widget.initialValue,
      trailingIcon: widget.onSelectTap != null
          ? CommonGestureDetector(
              onTap: _handleSelectTap,
              child: _isExpanded
                  ? UikitAssets.icons24.chevronUp.svg()
                  : UikitAssets.icons24.chevronDown.svg(),
            )
          : null,
      captionIconPath: widget.captionIconPath,
      textInputAction: widget.textInputAction,
      captionHelperText: widget.captionHelperText,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.characters,
    );
  }
}
