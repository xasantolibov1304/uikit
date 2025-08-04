// Flutter imports:
import 'package:flutter/material.dart';

class BackgroundGradients extends ThemeExtension<BackgroundGradients> {
  const BackgroundGradients({
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  final LinearGradient primary;
  final LinearGradient secondary;
  final LinearGradient accent;

  @override
  ThemeExtension<BackgroundGradients> copyWith({
    LinearGradient? primary,
    LinearGradient? secondary,
    LinearGradient? accent,
  }) {
    return BackgroundGradients(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
    );
  }

  @override
  BackgroundGradients lerp(
    covariant ThemeExtension<BackgroundGradients>? other,
    double t,
  ) {
    if (other == null || other is! BackgroundGradients) {
      return this;
    }

    return BackgroundGradients(
      primary: Gradient.lerp(primary, other.primary, t) as LinearGradient,
      secondary: Gradient.lerp(secondary, other.secondary, t) as LinearGradient,
      accent: Gradient.lerp(accent, other.accent, t) as LinearGradient,
    );
  }
}
