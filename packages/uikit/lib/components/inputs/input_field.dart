// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:iman_uikit/components/indicators/progress_indicator.dart';
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
    this.controller,
    this.initialValue,
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
    this.isReadOnly = false,
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
  final TextEditingController? controller;

  final InputFieldSize size;
  final InputFieldStatus status;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final bool isEnabled;
  final bool isReadOnly;
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
  //
  late FocusNode focusNode;
  late TextEditingController controller;

  bool get showClear =>
      widget.canClear && focusNode.hasFocus && controller.text.isNotEmpty;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();

    controller.text = widget.initialValue ?? '';

    if (widget.canClear) {
      controller.addListener(updateState);
      focusNode.addListener(updateState);
    }
    super.initState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    if (widget.canClear) {
      controller.removeListener(updateState);
      focusNode.removeListener(updateState);
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isEnabled ? 1 : 0.5,
      child: FormField(
        validator: widget.validator,
        initialValue: controller.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (FormFieldState<String> field) {
          return Column(
            children: [
              GestureDetector(
                onTap: focusNode.requestFocus,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: widget.size.size,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: _borderColor,
                    ),
                    color: context.fieldColors.background,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
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
                          decoration: _decoration,
                          //
                          focusNode: focusNode,
                          controller: controller,
                          enabled: widget.isEnabled,
                          readOnly: widget.isReadOnly,
                          autofocus: widget.autofocus,
                          textAlign: widget.textAlign,
                          cursorHeight: 16,
                          cursorColor: Colors.black,
                          obscureText: widget.obscureText,
                          style: context.input.placeholder,
                          keyboardType: widget.keyboardType,
                          textInputAction: widget.textInputAction,
                          textCapitalization: widget.textCapitalization,
                          //
                          minLines: widget.minLines,
                          maxLines: widget.maxLines,
                          maxLength: widget.maxLength,
                          buildCounter: buildCounter,
                          inputFormatters: widget.inputFormatters,
                          //
                          onTap: widget.onTap,
                          onChanged: widget.onChanged,
                          onEditingComplete: widget.onEditingComplete,
                          //
                          textAlignVertical: TextAlignVertical.center,
                          magnifierConfiguration:
                              TextMagnifierConfiguration.disabled,
                        ),
                      ),
                      if (widget.suffixLabel != null ||
                          widget.suffixValue != null) ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.suffixLabel != null) ...[
                              Text(
                                widget.suffixLabel!,
                                style: context.input.label.copyWith(
                                  color: context.textColors.tertiary,
                                ),
                              ),
                            ],
                            if (widget.suffixValue != null) ...[
                              Text(
                                widget.suffixValue ?? '',
                                style: context.input.placeholder.copyWith(
                                  color: context.textColors.tertiary,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(width: 12),
                      ],
                      if (widget.isLoading) ...[
                        const SizedBox(width: 8),
                        _loading,
                      ],
                      if (showClear) ...[
                        const SizedBox(width: 8),
                        _clearButton,
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
                ),
              ),
              _captionWidget,
            ],
          );
        },
      ),
    );
  }

  Color get _borderColor {
    final isFocused = focusNode.hasFocus;
    if (!widget.isEnabled) {
      return Colors.transparent;
    }
    switch (widget.status) {
      case InputFieldStatus.error:
        return context.fieldColors.error;
      case InputFieldStatus.warning:
        return context.fieldColors.warning;
      case InputFieldStatus.success:
        return context.fieldColors.success;
      default:
        return isFocused && widget.isEnabled
            ? context.fieldColors.borderFocused
            : Colors.transparent;
    }
  }

  Widget get _loading {
    return MyProgressIndicator(
      size: 20,
      color: context.iconColors.primary,
    );
  }

  Widget get _clearButton {
    return SizedBox(
      width: _iconSize,
      height: _iconSize,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onClear,
        child: UikitAssets.icons24.closeCircle.svg(),
      ),
    );
  }

  void _onClear() {
    controller.clear();
    widget.onChanged?.call('');
  }

  InputDecoration get _decoration {
    return InputDecoration(
      labelStyle: context.input.label,
      helperStyle: context.input.caption,
      counterStyle: context.input.caption,
      contentPadding: const EdgeInsets.all(4),
      hintStyle: context.input.placeholder.copyWith(
        color: context.textColors.tertiary,
      ),
      hintText: widget.isEnabled ? widget.hintText : null,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? '',
            style: context.input.placeholder.copyWith(
              color: context.textColors.tertiary,
            ),
          ),
          if (widget.isRequired)
            Text(
              '*',
              style: context.input.placeholder.copyWith(
                color: context.textColors.error,
              ),
            ),
        ],
      ),
    );
  }

  Widget get _captionWidget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (widget.captionIconPath != null) ...[
                      SvgPicture.asset(
                        widget.captionIconPath!,
                        width: 16,
                        height: 16,
                        fit: BoxFit.contain,
                        package: UikitAssets.package,
                        colorFilter: ColorFilter.mode(
                          _captionIconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      widget.captionText ?? '',
                      style: context.input.caption.copyWith(
                        color: _captionColor,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (widget.captionHelperText != null) ...[
                Text(
                  widget.captionHelperText ?? '',
                  style: context.input.caption.copyWith(
                    color: _captionColor,
                  ),
                  maxLines: 2,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Color get _captionIconColor {
    if (!widget.isEnabled) {
      return context.iconColors.muted;
    }
    switch (widget.status) {
      case InputFieldStatus.error:
        return context.textColors.error;
      case InputFieldStatus.warning:
        return context.textColors.warning;
      case InputFieldStatus.success:
        return context.textColors.success;
      default:
        return context.iconColors.primary;
    }
  }

  Color get _captionColor {
    if (!widget.isEnabled) {
      return Colors.black.withValues(alpha: 0.5);
    }
    switch (widget.status) {
      case InputFieldStatus.error:
        return context.textColors.error;
      case InputFieldStatus.warning:
        return context.textColors.warning;
      case InputFieldStatus.success:
        return context.textColors.success;
      default:
        return Colors.black.withValues(alpha: 0.5);
    }
  }

  Widget? buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return null;
  }
}
