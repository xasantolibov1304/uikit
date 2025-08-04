// Flutter imports:
import 'package:flutter/material.dart';

class ButtonGradients extends ThemeExtension<ButtonGradients> {
  const ButtonGradients({
    required this.primary,
    required this.secondary,
    required this.success,
  });

  final LinearGradient primary;
  final LinearGradient secondary;
  final LinearGradient success;

  @override
  ThemeExtension<ButtonGradients> copyWith({
    LinearGradient? primary,
    LinearGradient? secondary,
    LinearGradient? success,
  }) {
    return ButtonGradients(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
    );
  }

  @override
  ButtonGradients lerp(
    covariant ThemeExtension<ButtonGradients>? other,
    double t,
  ) {
    if (other == null || other is! ButtonGradients) {
      return this;
    }

    return ButtonGradients(
      primary: Gradient.lerp(primary, other.primary, t) as LinearGradient,
      secondary: Gradient.lerp(secondary, other.secondary, t) as LinearGradient,
      success: Gradient.lerp(success, other.success, t) as LinearGradient,
    );
  }
}
