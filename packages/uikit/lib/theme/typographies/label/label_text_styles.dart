// Flutter imports:
import 'package:flutter/material.dart';

class LabelTextStyles extends ThemeExtension<LabelTextStyles> {
  const LabelTextStyles({
    required this.main,
    required this.medium1,
    required this.medium2,
    required this.large,
  });

  /// fontSize: 13, height: 16/13, weight: 400
  final TextStyle main;

  /// fontSize: 14, height: 20/14, weight: 500
  final TextStyle medium1;

  /// fontSize: 14, height: 20/14, weight: 600
  final TextStyle medium2;

  /// fontSize: 16, height: 20/16, weight: 600
  final TextStyle large;

  @override
  ThemeExtension<LabelTextStyles> copyWith({
    TextStyle? main,
    TextStyle? medium1,
    TextStyle? medium2,
    TextStyle? large,
  }) {
    return LabelTextStyles(
      main: main ?? this.main,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<LabelTextStyles> lerp(
    covariant ThemeExtension<LabelTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! LabelTextStyles) return this;
    return LabelTextStyles(
      main: TextStyle.lerp(main, other.main, t)!,
      medium1: TextStyle.lerp(medium1, other.medium1, t)!,
      medium2: TextStyle.lerp(medium2, other.medium2, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
