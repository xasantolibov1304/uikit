// Flutter imports:
import 'package:flutter/material.dart';

class BaseTextStyles extends ThemeExtension<BaseTextStyles> {
  const BaseTextStyles({
    required this.base1,
    required this.base2,
    required this.base3,
    required this.base4,
    required this.base5,
    required this.base6,
  });

  /// Base 1: fontSize: 16, height: 20, weight: 400
  final TextStyle base1;

  /// Base 2: fontSize: 15, height: 20, weight: 400
  final TextStyle base2;

  /// Base 3: fontSize: 14, height: 18, weight: 400
  final TextStyle base3;

  /// Base 4: fontSize: 13, height: 16, weight: 400
  final TextStyle base4;

  /// Base 5: fontSize: 12, height: 14, weight: 400
  final TextStyle base5;

  /// Base 6: fontSize: 10, height: 12, weight: 400
  final TextStyle base6;

  @override
  ThemeExtension<BaseTextStyles> copyWith({
    TextStyle? base1,
    TextStyle? base2,
    TextStyle? base3,
    TextStyle? base4,
    TextStyle? base5,
    TextStyle? base6,
  }) {
    return BaseTextStyles(
      base1: base1 ?? this.base1,
      base2: base2 ?? this.base2,
      base3: base3 ?? this.base3,
      base4: base4 ?? this.base4,
      base5: base5 ?? this.base5,
      base6: base6 ?? this.base6,
    );
  }

  @override
  ThemeExtension<BaseTextStyles> lerp(
    covariant ThemeExtension<BaseTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! BaseTextStyles) return this;
    return BaseTextStyles(
      base1: TextStyle.lerp(base1, other.base1, t)!,
      base2: TextStyle.lerp(base2, other.base2, t)!,
      base3: TextStyle.lerp(base3, other.base3, t)!,
      base4: TextStyle.lerp(base4, other.base4, t)!,
      base5: TextStyle.lerp(base5, other.base5, t)!,
      base6: TextStyle.lerp(base6, other.base6, t)!,
    );
  }
}
