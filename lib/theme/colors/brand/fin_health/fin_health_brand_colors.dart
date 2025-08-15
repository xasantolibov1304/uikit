// Flutter imports:
import 'package:flutter/material.dart';

class FinHealthBrandColors extends ThemeExtension<FinHealthBrandColors> {
  const FinHealthBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;

  @override
  ThemeExtension<FinHealthBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      FinHealthBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  @override
  ThemeExtension<FinHealthBrandColors> lerp(
    covariant ThemeExtension<FinHealthBrandColors>? other,
    double t,
  ) {
    if (other == null || other is! FinHealthBrandColors) {
      return this;
    }
    return FinHealthBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
