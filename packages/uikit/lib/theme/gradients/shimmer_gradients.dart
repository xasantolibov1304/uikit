// Flutter imports:
import 'package:flutter/material.dart';

class ShimmerGradients extends ThemeExtension<ShimmerGradients> {
  const ShimmerGradients({
    required this.base,
    required this.primary,
    required this.secondary,
  });

  final LinearGradient base;
  final LinearGradient primary;
  final LinearGradient secondary;

  @override
  ThemeExtension<ShimmerGradients> copyWith({
    LinearGradient? base,
    LinearGradient? primary,
    LinearGradient? secondary,
  }) {
    return ShimmerGradients(
      base: base ?? this.base,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ShimmerGradients lerp(
    covariant ThemeExtension<ShimmerGradients>? other,
    double t,
  ) {
    if (other == null || other is! ShimmerGradients) {
      return this;
    }

    return ShimmerGradients(
      base: Gradient.lerp(base, other.base, t) as LinearGradient,
      primary: Gradient.lerp(primary, other.primary, t) as LinearGradient,
      secondary: Gradient.lerp(secondary, other.secondary, t) as LinearGradient,
    );
  }
}
