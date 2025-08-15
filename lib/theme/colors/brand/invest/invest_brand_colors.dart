// Flutter imports:
import 'package:flutter/material.dart';

class InvestBrandColors extends ThemeExtension<InvestBrandColors> {
  const InvestBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;

  @override
  ThemeExtension<InvestBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      InvestBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  @override
  ThemeExtension<InvestBrandColors> lerp(
    covariant ThemeExtension<InvestBrandColors>? other,
    double t,
  ) {
    if (other == null || other is! InvestBrandColors) {
      return this;
    }
    return InvestBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
