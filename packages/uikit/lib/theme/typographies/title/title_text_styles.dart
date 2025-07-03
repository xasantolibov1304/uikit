// Flutter imports:
import 'package:flutter/material.dart';

class TitleTextStyles extends ThemeExtension<TitleTextStyles> {
  const TitleTextStyles({
    required this.compact1,
    required this.compact2,
    required this.main1,
    required this.main2,
    required this.medium1,
    required this.medium2,
    required this.medium3,
    required this.large1,
    required this.large2,
  });

  /// fontSize: 16, height: 20/16, weight: 500
  final TextStyle compact1;

  /// fontSize: 16, height: 20/16, weight: 600
  final TextStyle compact2;

  /// fontSize: 16, height: 24/16, weight: 500
  final TextStyle main1;

  /// fontSize: 16, height: 24/16, weight: 600
  final TextStyle main2;

  /// fontSize: 18, height: 20/18, weight: 600
  final TextStyle medium1;

  /// fontSize: 18, height: 22/18, weight: 600
  final TextStyle medium2;

  /// fontSize: 18, height: 24/18, weight: 600
  final TextStyle medium3;

  /// fontSize: 20, height: 24/20, weight: 600
  final TextStyle large1;

  /// fontSize: 22, height: 24/22, weight: 600
  final TextStyle large2;

  @override
  ThemeExtension<TitleTextStyles> copyWith({
    TextStyle? compact1,
    TextStyle? compact2,
    TextStyle? main1,
    TextStyle? main2,
    TextStyle? medium1,
    TextStyle? medium2,
    TextStyle? medium3,
    TextStyle? large1,
    TextStyle? large2,
  }) {
    return TitleTextStyles(
      compact1: compact1 ?? this.compact1,
      compact2: compact2 ?? this.compact2,
      main1: main1 ?? this.main1,
      main2: main2 ?? this.main2,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      medium3: medium3 ?? this.medium3,
      large1: large1 ?? this.large1,
      large2: large2 ?? this.large2,
    );
  }

  @override
  ThemeExtension<TitleTextStyles> lerp(
    covariant ThemeExtension<TitleTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! TitleTextStyles) return this;
    return TitleTextStyles(
      compact1: TextStyle.lerp(compact1, other.compact1, t)!,
      compact2: TextStyle.lerp(compact2, other.compact2, t)!,
      main1: TextStyle.lerp(main1, other.main1, t)!,
      main2: TextStyle.lerp(main2, other.main2, t)!,
      medium1: TextStyle.lerp(medium1, other.medium1, t)!,
      medium2: TextStyle.lerp(medium2, other.medium2, t)!,
      medium3: TextStyle.lerp(medium3, other.medium3, t)!,
      large1: TextStyle.lerp(large1, other.large1, t)!,
      large2: TextStyle.lerp(large2, other.large2, t)!,
    );
  }
}
