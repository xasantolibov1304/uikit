// Flutter imports:
import 'package:flutter/material.dart';

class TitleTextStyles extends ThemeExtension<TitleTextStyles> {
  const TitleTextStyles({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  /// Title 1: fontSize: 24, height: 28, weight: 600
  final TextStyle title1;

  /// Title 2: fontSize: 20, height: 24, weight: 600
  final TextStyle title2;

  /// Title 3: fontSize: 16, height: 20, weight: 600
  final TextStyle title3;

  /// Title 4: fontSize: 14, height: 16, weight: 600
  final TextStyle title4;

  @override
  ThemeExtension<TitleTextStyles> copyWith({
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
  }) {
    return TitleTextStyles(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
    );
  }

  @override
  ThemeExtension<TitleTextStyles> lerp(
    covariant ThemeExtension<TitleTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! TitleTextStyles) return this;
    return TitleTextStyles(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      title4: TextStyle.lerp(title4, other.title4, t)!,
    );
  }
}
