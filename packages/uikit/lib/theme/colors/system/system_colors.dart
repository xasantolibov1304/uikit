// Flutter imports:
import 'package:flutter/material.dart';

class SystemColors extends ThemeExtension<SystemColors> {
  const SystemColors({
    required this.white,
    required this.black,
    required this.transparent,
    required this.red,
  });

  final Color white;
  final Color black;
  final Color transparent;
  final Color red;

  @override
  ThemeExtension<SystemColors> copyWith({
    Color? white,
    Color? black,
    Color? transparent,
    Color? red,
  }) =>
      SystemColors(
        white: white ?? this.white,
        black: black ?? this.black,
        transparent: transparent ?? this.transparent,
        red: red ?? this.red,
      );

  @override
  ThemeExtension<SystemColors> lerp(
    covariant ThemeExtension<SystemColors>? other,
    double t,
  ) {
    if (other == null || other is! SystemColors) {
      return this;
    }
    return SystemColors(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      red: Color.lerp(red, other.red, t)!,
    );
  }
}
