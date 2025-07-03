// Flutter imports:
import 'package:flutter/material.dart';

class DisplayTextStyles extends ThemeExtension<DisplayTextStyles> {
  const DisplayTextStyles({
    required this.compact,
    required this.main,
    required this.large,
  });

  /// fontSize: 28, height: 32/28, weight: 700
  final TextStyle compact;

  /// fontSize: 36, height: 40/36, weight: 700
  final TextStyle main;

  /// fontSize: 44, height: 52/44, weight: 700
  final TextStyle large;

  @override
  ThemeExtension<DisplayTextStyles> copyWith({
    TextStyle? compact,
    TextStyle? main,
    TextStyle? large,
  }) {
    return DisplayTextStyles(
      compact: compact ?? this.compact,
      main: main ?? this.main,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<DisplayTextStyles> lerp(
    covariant ThemeExtension<DisplayTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! DisplayTextStyles) return this;
    return DisplayTextStyles(
      compact: TextStyle.lerp(compact, other.compact, t)!,
      main: TextStyle.lerp(main, other.main, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }
}
