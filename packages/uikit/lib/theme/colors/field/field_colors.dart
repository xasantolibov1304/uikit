// Flutter imports:
import 'package:flutter/material.dart';

class FieldColors extends ThemeExtension<FieldColors> {
  const FieldColors({
    required this.background,
    required this.backgroundDisabled,
    required this.border,
    required this.borderHover,
    required this.borderFocused,
    required this.borderError,
    required this.borderSuccess,
    required this.borderDisabled,
    required this.cursor,
    required this.placeholder,
    required this.text,
    required this.textDisabled,
    required this.icon,
    required this.iconDisabled,
    required this.error,
    required this.warning,
    required this.success,
    required this.helper,
  });

  final Color background;
  final Color backgroundDisabled;
  final Color border;
  final Color borderHover;
  final Color borderFocused;
  final Color borderError;
  final Color borderSuccess;
  final Color borderDisabled;
  final Color cursor;
  final Color placeholder;
  final Color text;
  final Color textDisabled;
  final Color icon;
  final Color iconDisabled;
  final Color error;
  final Color warning;
  final Color success;
  final Color helper;

  @override
  ThemeExtension<FieldColors> copyWith({
    Color? background,
    Color? backgroundDisabled,
    Color? border,
    Color? borderHover,
    Color? borderFocused,
    Color? borderError,
    Color? borderSuccess,
    Color? borderDisabled,
    Color? cursor,
    Color? placeholder,
    Color? text,
    Color? textDisabled,
    Color? icon,
    Color? iconDisabled,
    Color? error,
    Color? warning,
    Color? success,
    Color? helper,
  }) =>
      FieldColors(
        background: background ?? this.background,
        backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
        border: border ?? this.border,
        borderHover: borderHover ?? this.borderHover,
        borderFocused: borderFocused ?? this.borderFocused,
        borderError: borderError ?? this.borderError,
        borderSuccess: borderSuccess ?? this.borderSuccess,
        borderDisabled: borderDisabled ?? this.borderDisabled,
        cursor: cursor ?? this.cursor,
        placeholder: placeholder ?? this.placeholder,
        text: text ?? this.text,
        textDisabled: textDisabled ?? this.textDisabled,
        icon: icon ?? this.icon,
        iconDisabled: iconDisabled ?? this.iconDisabled,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        success: success ?? this.success,
        helper: helper ?? this.helper,
      );

  @override
  ThemeExtension<FieldColors> lerp(
    covariant ThemeExtension<FieldColors>? other,
    double t,
  ) {
    if (other == null || other is! FieldColors) {
      return this;
    }
    return FieldColors(
      background: Color.lerp(background, other.background, t)!,
      backgroundDisabled:
          Color.lerp(backgroundDisabled, other.backgroundDisabled, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderHover: Color.lerp(borderHover, other.borderHover, t)!,
      borderFocused: Color.lerp(borderFocused, other.borderFocused, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
      cursor: Color.lerp(cursor, other.cursor, t)!,
      placeholder: Color.lerp(placeholder, other.placeholder, t)!,
      text: Color.lerp(text, other.text, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      helper: Color.lerp(helper, other.helper, t)!,
    );
  }
}
