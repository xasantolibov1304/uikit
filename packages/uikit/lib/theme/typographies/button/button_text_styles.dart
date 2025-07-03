// Flutter imports:
import 'package:flutter/material.dart';

class ButtonTextStyles extends ThemeExtension<ButtonTextStyles> {
  const ButtonTextStyles({
    required this.main,
    required this.subtext,
    required this.count,
  });

  /// fontSize: 16, height: 24/16, weight: 600
  final TextStyle main;

  /// fontSize: 11, height: 12/11, weight: 400
  final TextStyle subtext;

  /// fontSize: 16, height: 20/16, weight: 600
  final TextStyle count;

  @override
  ThemeExtension<ButtonTextStyles> copyWith({
    TextStyle? main,
    TextStyle? subtext,
    TextStyle? count,
  }) {
    return ButtonTextStyles(
      main: main ?? this.main,
      subtext: subtext ?? this.subtext,
      count: count ?? this.count,
    );
  }

  @override
  ThemeExtension<ButtonTextStyles> lerp(
      covariant ThemeExtension<ButtonTextStyles>? other, double t) {
    if (other == null || other is! ButtonTextStyles) return this;
    return ButtonTextStyles(
      main: TextStyle.lerp(main, other.main, t)!,
      subtext: TextStyle.lerp(subtext, other.subtext, t)!,
      count: TextStyle.lerp(count, other.count, t)!,
    );
  }
}
