// Flutter imports:
import 'package:flutter/material.dart';

class CardGradients extends ThemeExtension<CardGradients> {
  const CardGradients({
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  final LinearGradient primary;
  final LinearGradient secondary;
  final LinearGradient accent;

  @override
  ThemeExtension<CardGradients> copyWith({
    LinearGradient? primary,
    LinearGradient? secondary,
    LinearGradient? accent,
  }) {
    return CardGradients(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
    );
  }

  @override
  CardGradients lerp(
    covariant ThemeExtension<CardGradients>? other,
    double t,
  ) {
    if (other == null || other is! CardGradients) {
      return this;
    }

    return CardGradients(
      primary: Gradient.lerp(primary, other.primary, t) as LinearGradient,
      secondary: Gradient.lerp(secondary, other.secondary, t) as LinearGradient,
      accent: Gradient.lerp(accent, other.accent, t) as LinearGradient,
    );
  }
}
