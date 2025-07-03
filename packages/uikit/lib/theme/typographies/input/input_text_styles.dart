// Flutter imports:
import 'package:flutter/material.dart';

class InputTextStyles extends ThemeExtension<InputTextStyles> {
  const InputTextStyles({
    required this.label,
    required this.placeholder,
    required this.suffix,
    required this.caption,
  });

  /// fontSize: 13, height: 16/13, weight: 400
  final TextStyle label;

  /// fontSize: 16, height: 24/16, weight: 500
  final TextStyle placeholder;

  /// fontSize: 14, height: 22/14, weight: 400
  final TextStyle suffix;

  /// fontSize: 13, height: 16/13, weight: 400
  final TextStyle caption;

  @override
  ThemeExtension<InputTextStyles> copyWith({
    TextStyle? label,
    TextStyle? placeholder,
    TextStyle? suffix,
    TextStyle? caption,
  }) {
    return InputTextStyles(
      label: label ?? this.label,
      placeholder: placeholder ?? this.placeholder,
      suffix: suffix ?? this.suffix,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<InputTextStyles> lerp(
      covariant ThemeExtension<InputTextStyles>? other, double t) {
    if (other == null || other is! InputTextStyles) return this;
    return InputTextStyles(
      label: TextStyle.lerp(label, other.label, t)!,
      placeholder: TextStyle.lerp(placeholder, other.placeholder, t)!,
      suffix: TextStyle.lerp(suffix, other.suffix, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }
}
