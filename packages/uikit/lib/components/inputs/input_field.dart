// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/components/indicators/loading_indicator.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _iconSize = 24.0;
const _leadingIconSize = 40.0;

enum InputFieldSize {
  small(48),
  medium(56),
  large(64);

  final double size;

  const InputFieldSize(this.size);
}

enum InputFieldStatus {
  error,
  warning,
  success,
  info,
}

class InputField extends StatefulWidget {
  const InputField({
    this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    this.suffixLabel,
    this.suffixValue,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.size = InputFieldSize.large,
    this.status = InputFieldStatus.info,
    //
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.isRequired = false,
    this.canClear = true,
    this.isLoading = false,
    //
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    //
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    //
    this.leadingIcon,
    this.trailingIcon,
    //
    this.onTap,
    this.onChanged,
    this.validator,
    this.onEditingComplete,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final String? suffixLabel;
  final String? suffixValue;

  /// Don't dispose this controller!
  /// It will be disposed by the InputField itself
  final TextEditingController? controller;

  final InputFieldSize size;
  final InputFieldStatus status;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool obscureText;
  final bool isRequired;
  final bool canClear;
  final bool isLoading;

  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();

    if (widget.canClear) {
      _controller.addListener(updateState);
      _focusNode.addListener(updateState);
    }

    _controller.text = widget.initialValue ?? '';

    _focusNode.addListener(_onFocusChange);
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    if (widget.canClear) {
      _controller.removeListener(updateState);
      _focusNode.removeListener(updateState);
    }
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _hasFocus = _focusNode.hasFocus;
    updateState();
  }

  void _onClear() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isEnabled ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormField(
            validator: widget.validator,
            initialValue: widget.initialValue,
            builder: (FormFieldState<Object?> formFieldState) {
              return Container(
                height: widget.size.size,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: _borderColor,
                  ),
                  color: context.fieldColors.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    if (widget.leadingIcon != null) ...[
                      SizedBox(
                        width: _leadingIconSize,
                        height: _leadingIconSize,
                        child: widget.leadingIcon!,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: TextField(
                        cursorHeight: 16,
                        autocorrect: false,
                        onTap: widget.onTap,
                        focusNode: _focusNode,
                        controller: _controller,
                        enableSuggestions: false,
                        enabled: widget.isEnabled,
                        minLines: widget.minLines,
                        maxLines: widget.maxLines,
                        maxLength: widget.maxLength,
                        cursorColor: Colors.black,
                        readOnly: widget.readonly,
                        autofocus: widget.autofocus,
                        onChanged: widget.onChanged,
                        textAlign: widget.textAlign,
                        buildCounter: _buildCounter,
                        obscureText: widget.obscureText,
                        keyboardType: widget.keyboardType,
                        decoration: _buildInputDecoration,
                        inputFormatters: widget.inputFormatters,
                        textInputAction: widget.textInputAction,
                        style: context.inputTextStyle.placeholder,
                        onEditingComplete: widget.onEditingComplete,
                        textAlignVertical: TextAlignVertical.center,
                        textCapitalization: widget.textCapitalization,
                      ),
                    ),
                    if (widget.suffixLabel != null ||
                        widget.suffixValue != null) ...[
                      _buildSuffix(),
                      const SizedBox(width: 12),
                    ],
                    if (widget.isLoading) ...[
                      const SizedBox(width: 8),
                      const LoadingIndicator(),
                    ],
                    if (_shouldShowClear()) ...[
                      const SizedBox(width: 8),
                      _buildClearButton(),
                    ],
                    if (widget.trailingIcon != null) ...[
                      const SizedBox(width: 8),
                      SizedBox(
                        width: _iconSize,
                        height: _iconSize,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: widget.trailingIcon!,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
          _buildCaption(),
        ],
      ),
    );
  }

  InputDecoration get _buildInputDecoration {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(4),
      labelStyle: context.inputTextStyle.placeholder.copyWith(
        color: context.textColors.tertiary,
      ),
      helperStyle: context.inputTextStyle.caption,
      counterStyle: context.inputTextStyle.caption,
      hintStyle: context.inputTextStyle.placeholder.copyWith(
        color: context.textColors.tertiary,
      ),
      floatingLabelStyle: context.inputTextStyle.label.copyWith(
        color: context.textColors.tertiary,
      ),
      label: widget.label != null ? _buildLabel() : null,
      hintText: widget.isEnabled ? widget.hintText : null,
    );
  }

  Widget _buildLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label!,
          style: context.inputTextStyle.placeholder.copyWith(
            color: context.textColors.tertiary,
          ),
        ),
        if (widget.isRequired)
          Text(
            '*',
            style: context.inputTextStyle.placeholder.copyWith(
              color: context.textColors.error,
            ),
          ),
      ],
    );
  }

  Widget _buildSuffix() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.suffixLabel != null)
          Text(
            widget.suffixLabel!,
            style: context.inputTextStyle.label.copyWith(
              color: context.textColors.tertiary,
            ),
          ),
        if (widget.suffixValue != null)
          Text(
            widget.suffixValue!,
            style: context.inputTextStyle.placeholder.copyWith(
              color: context.textColors.tertiary,
            ),
          ),
      ],
    );
  }

  Widget _buildClearButton() {
    return SizedBox(
      width: _iconSize,
      height: _iconSize,
      child: CommonGestureDetector(
        onTap: _onClear,
        child: UikitAssets.icons24.closeCircle.svg(),
      ),
    );
  }

  Widget _buildCaption() {
    final validationText = _validateInputText();
    final hasCaption = widget.captionText != null ||
        widget.captionHelperText != null ||
        widget.captionIconPath != null;

    if (!hasCaption && validationText == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 6),
          Row(
            children: [
              if (widget.captionIconPath != null) ...[
                SvgPicture.asset(
                  widget.captionIconPath!,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                  package: UikitAssets.package,
                  colorFilter: ColorFilter.mode(
                    _captionColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Text(
                  validationText ?? widget.captionText ?? '',
                  maxLines: 1,
                  style: context.inputTextStyle.caption.copyWith(
                    color: _captionColor,
                  ),
                ),
              ),
              if (widget.captionHelperText != null)
                Text(
                  widget.captionHelperText!,
                  maxLines: 1,
                  style: context.inputTextStyle.caption.copyWith(
                    color: _captionColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  InputFieldStatus get _inputStatus {
    final hasValidationError = _validateInputText() != null;
    return hasValidationError ? InputFieldStatus.error : widget.status;
  }

  Color get _borderColor {
    if (!widget.isEnabled) return Colors.transparent;

    if (_hasFocus) return context.fieldColors.borderFocused;

    switch (_inputStatus) {
      case InputFieldStatus.error:
        return context.fieldColors.error;
      case InputFieldStatus.warning:
        return context.fieldColors.warning;
      case InputFieldStatus.success:
        return context.fieldColors.success;
      default:
        return Colors.transparent;
    }
  }

  Color get _captionColor {
    if (!widget.isEnabled) return context.textColors.tertiary;

    switch (_inputStatus) {
      case InputFieldStatus.error:
        return context.textColors.error;
      case InputFieldStatus.warning:
        return context.textColors.warning;
      case InputFieldStatus.success:
        return context.textColors.success;
      default:
        return context.textColors.tertiary;
    }
  }

  bool _shouldShowClear() {
    return widget.canClear && _hasFocus && _controller.text.isNotEmpty;
  }

  String? _validateInputText() {
    if (widget.validator == null) return null;
    return widget.validator!(_controller.text);
  }

  Widget? _buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return null;
  }
}
