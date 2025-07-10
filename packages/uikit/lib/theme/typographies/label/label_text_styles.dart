// Flutter imports:
import 'package:flutter/material.dart';

class LabelTextStyles extends ThemeExtension<LabelTextStyles> {
  const LabelTextStyles({
    required this.main1,
    required this.main2,
    required this.medium1,
    required this.medium2,
    required this.large,
  });

  /// fontSize: 13, height: 16/13, weight: 400
  final TextStyle main1;

  /// fontSize: 13, height: 16/13, weight: 500
  final TextStyle main2;

  /// fontSize: 14, height: 20/14, weight: 500
  final TextStyle medium1;

  /// fontSize: 14, height: 16/14, weight: 500
  final TextStyle medium2;

  /// fontSize: 16, height: 20/16, weight: 600
  final TextStyle large;

  @override
  ThemeExtension<LabelTextStyles> copyWith({
    TextStyle? main1,
    TextStyle? main2,
    TextStyle? medium1,
    TextStyle? medium2,
    TextStyle? large,
  }) {
    return LabelTextStyles(
      main1: main1 ?? this.main1,
      main2: main2 ?? this.main2,
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
      main1: TextStyle.lerp(main1, other.main1, t)!,
      main2: TextStyle.lerp(main2, other.main2, t)!,
      medium1: TextStyle.lerp(medium1, other.medium1, t)!,
      medium2: TextStyle.lerp(medium2, other.medium2, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
