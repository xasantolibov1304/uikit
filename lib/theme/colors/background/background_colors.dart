// Flutter imports:
import 'package:flutter/material.dart';

class BackgroundColors extends ThemeExtension<BackgroundColors> {
  const BackgroundColors({
    required this.primary,
    required this.secondary,
    required this.transparent,
  });

  final Color primary;
  final Color secondary;
  final Color transparent;

  @override
  ThemeExtension<BackgroundColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? transparent,
  }) =>
      BackgroundColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        transparent: transparent ?? this.transparent,
      );

  @override
  ThemeExtension<BackgroundColors> lerp(
    covariant ThemeExtension<BackgroundColors>? other,
    double t,
  ) {
    if (other == null || other is! BackgroundColors) {
      return this;
    }
    return BackgroundColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }
}
