// Flutter imports:
import 'package:flutter/material.dart';

class OthersTextStyles extends ThemeExtension<OthersTextStyles> {
  const OthersTextStyles({
    required this.cardBank,
  });

  /// Card Bank: fontSize: 24, height: 28, weight: 600 (same as Title 1)
  final TextStyle cardBank;

  @override
  ThemeExtension<OthersTextStyles> copyWith({
    TextStyle? cardBank,
  }) {
    return OthersTextStyles(
      cardBank: cardBank ?? this.cardBank,
    );
  }

  @override
  ThemeExtension<OthersTextStyles> lerp(
    covariant ThemeExtension<OthersTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! OthersTextStyles) return this;
    return OthersTextStyles(
      cardBank: TextStyle.lerp(cardBank, other.cardBank, t)!,
    );
  }
}
