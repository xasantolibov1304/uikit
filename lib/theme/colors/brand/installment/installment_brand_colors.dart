// Flutter imports:
import 'package:flutter/material.dart';

class InstallmentBrandColors extends ThemeExtension<InstallmentBrandColors> {
  const InstallmentBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;

  @override
  ThemeExtension<InstallmentBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      InstallmentBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  @override
  ThemeExtension<InstallmentBrandColors> lerp(
    covariant ThemeExtension<InstallmentBrandColors>? other,
    double t,
  ) {
    if (other == null || other is! InstallmentBrandColors) {
      return this;
    }
    return InstallmentBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
