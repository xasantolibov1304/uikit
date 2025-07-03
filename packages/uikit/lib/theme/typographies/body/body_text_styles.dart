// Flutter imports:
import 'package:flutter/material.dart';

class BodyTextStyles extends ThemeExtension<BodyTextStyles> {
  const BodyTextStyles({
    required this.compact1,
    required this.compact2,
    required this.main,
    required this.medium1,
    required this.medium2,
    required this.medium3,
    required this.large,
  });

  /// fontSize: 13, height: 16/13, weight: 400
  final TextStyle compact1;

  /// fontSize: 14, height: 18/14, weight: 400
  final TextStyle compact2;

  /// fontSize: 15, height: 20/15, weight: 400
  final TextStyle main;

  /// fontSize: 16, height: 20/16, weight: 400
  final TextStyle medium1;

  /// fontSize: 16, height: 22/16, weight: 400
  final TextStyle medium2;

  /// fontSize: 16, height: 24/16, weight: 400
  final TextStyle medium3;

  /// fontSize: 18, height: 22/18, weight: 400
  final TextStyle large;

  @override
  ThemeExtension<BodyTextStyles> copyWith({
    TextStyle? compact1,
    TextStyle? compact2,
    TextStyle? main,
    TextStyle? medium1,
    TextStyle? medium2,
    TextStyle? medium3,
    TextStyle? large,
  }) {
    return BodyTextStyles(
      compact1: compact1 ?? this.compact1,
      compact2: compact2 ?? this.compact2,
      main: main ?? this.main,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      medium3: medium3 ?? this.medium3,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<BodyTextStyles> lerp(
    covariant ThemeExtension<BodyTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! BodyTextStyles) return this;
    return BodyTextStyles(
      compact1: TextStyle.lerp(compact1, other.compact1, t)!,
      compact2: TextStyle.lerp(compact2, other.compact2, t)!,
      main: TextStyle.lerp(main, other.main, t)!,
      medium1: TextStyle.lerp(medium1, other.medium1, t)!,
      medium2: TextStyle.lerp(medium2, other.medium2, t)!,
      medium3: TextStyle.lerp(medium3, other.medium3, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
