// Flutter imports:
import 'package:flutter/material.dart';

class SuperAppBrandColors extends ThemeExtension<SuperAppBrandColors> {
  const SuperAppBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.transparent,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color transparent;

  @override
  ThemeExtension<SuperAppBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? transparent,
  }) =>
      SuperAppBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        transparent: transparent ?? this.transparent,
      );

  @override
  ThemeExtension<SuperAppBrandColors> lerp(
      covariant ThemeExtension<SuperAppBrandColors>? other,
      double t,
      ) {
    if (other == null || other is! SuperAppBrandColors) {
      return this;
    }
    return SuperAppBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }
}