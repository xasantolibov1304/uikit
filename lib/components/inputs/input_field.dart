// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/loaders/loading_indicator.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _iconSize = 24.0;

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
    this.focusNode,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.sentences,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.iconsCrossAxisAlignment = CrossAxisAlignment.center,
    //
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    //
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.isRequired = false,
    this.canClear = true,
    this.isLoading = false,
    //
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.showCounter = false,
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

  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextAlignVertical textAlignVertical;
  final TextCapitalization textCapitalization;
  final FloatingLabelBehavior floatingLabelBehavior;
  final CrossAxisAlignment iconsCrossAxisAlignment;

  final EdgeInsets? contentPadding;

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool obscureText;
  final bool isRequired;
  final bool canClear;
  final bool isLoading;

  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final bool showCounter;
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
  bool get _isMultiline => widget.minLines != null && widget.minLines! > 1;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();

    if (widget.canClear) {
      _controller.addListener(_updateState);
      _focusNode.addListener(_updateState);
    }

    _controller.text = widget.initialValue ?? '';

    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    _hasFocus = _focusNode.hasFocus;
    _updateState();
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    if (widget.canClear) {
      _controller.removeListener(_updateState);
      _focusNode.removeListener(_updateState);
    }
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
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
                padding: widget.contentPadding,
                height: _isMultiline ? null : widget.size.size,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: _borderColor,
                  ),
                  color: context.fieldColors.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _buildInputContent(),
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
      floatingLabelBehavior: widget.floatingLabelBehavior,
      labelStyle: context.titleTextStyle.main1.copyWith(
        color: context.textColors.tertiary,
      ),
      helperStyle: context.subtitleTextStyle.compact2,
      counterStyle: context.subtitleTextStyle.compact2,
      hintStyle: context.titleTextStyle.main1.copyWith(
        color: context.textColors.tertiary,
      ),
      floatingLabelStyle: context.labelTextStyle.main1.copyWith(
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
          style: context.titleTextStyle.main1.copyWith(
            color: context.textColors.tertiary,
          ),
        ),
        if (widget.isRequired)
          Text(
            '*',
            style: context.titleTextStyle.main1.copyWith(
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
            style: context.labelTextStyle.main1.copyWith(
              color: context.textColors.tertiary,
            ),
          ),
        if (widget.suffixValue != null)
          Text(
            widget.suffixValue!,
            style: context.titleTextStyle.main1.copyWith(
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

  void _onClear() {
    _controller.clear();
    widget.onChanged?.call('');
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
                  style: context.subtitleTextStyle.compact2.copyWith(
                    color: _captionColor,
                  ),
                ),
              ),
              if (widget.captionHelperText != null)
                Text(
                  widget.captionHelperText!,
                  maxLines: 1,
                  style: context.subtitleTextStyle.compact2.copyWith(
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

  Widget _buildInputContent() {
    if (_isMultiline && widget.showCounter) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInputRow(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${_controller.text.length}',
                  style: context.subtitleTextStyle.medium2.copyWith(
                    color: context.textColors.secondary,
                  ),
                ),
                TextSpan(
                  text: '/${widget.maxLength}',
                  style: context.subtitleTextStyle.medium2.copyWith(
                    color: context.textColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return _buildInputRow();
  }

  Widget _buildInputRow() {
    return Row(
      crossAxisAlignment: widget.iconsCrossAxisAlignment,
      children: [
        if (widget.leadingIcon != null) ...[
          widget.leadingIcon!,
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
            style: context.titleTextStyle.main1,
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onEditingComplete,
            textAlignVertical: widget.textAlignVertical,
            textCapitalization: widget.textCapitalization,
          ),
        ),
        if (widget.suffixLabel != null || widget.suffixValue != null) ...[
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
          widget.trailingIcon!,
        ],
      ],
    );
  }
}
