// Flutter imports:
import 'package:flutter/material.dart';

class SubtitleTextStyles extends ThemeExtension<SubtitleTextStyles> {
  const SubtitleTextStyles({
    required this.compact1,
    required this.compact2,
    required this.main,
    required this.medium1,
    required this.medium2,
    required this.large1,
    required this.large2,
  });

  /// fontSize: 12, height: 16/12, weight: 400
  final TextStyle compact1;

  /// fontSize: 13, height: 16/13, weight: 500
  final TextStyle compact2;

  /// fontSize: 14, height: 16/14, weight: 400
  final TextStyle main;

  /// fontSize: 14, height: 18/14, weight: 400
  final TextStyle medium1;

  /// fontSize: 14, height: 20/14, weight: 500
  final TextStyle medium2;

  /// fontSize: 15, height: 20/15, weight: 400
  final TextStyle large1;

  /// fontSize: 16, height: 20/16, weight: 500
  final TextStyle large2;

  @override
  ThemeExtension<SubtitleTextStyles> copyWith({
    TextStyle? compact1,
    TextStyle? compact2,
    TextStyle? main,
    TextStyle? medium1,
    TextStyle? medium2,
    TextStyle? large1,
    TextStyle? large2,
  }) {
    return SubtitleTextStyles(
      compact1: compact1 ?? this.compact1,
      compact2: compact2 ?? this.compact2,
      main: main ?? this.main,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      large1: large1 ?? this.large1,
      large2: large2 ?? this.large2,
    );
  }

  @override
  ThemeExtension<SubtitleTextStyles> lerp(
      covariant ThemeExtension<SubtitleTextStyles>? other, double t) {
    if (other == null || other is! SubtitleTextStyles) return this;
    return SubtitleTextStyles(
      compact1: TextStyle.lerp(compact1, other.compact1, t)!,
      compact2: TextStyle.lerp(compact2, other.compact2, t)!,
      main: TextStyle.lerp(main, other.main, t)!,
      medium1: TextStyle.lerp(medium1, other.medium1, t)!,
      medium2: TextStyle.lerp(medium2, other.medium2, t)!,
      large1: TextStyle.lerp(large1, other.large1, t)!,
      large2: TextStyle.lerp(large2, other.large2, t)!,
    );
  }
}
