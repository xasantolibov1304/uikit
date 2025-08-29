// Flutter imports:
import 'package:flutter/material.dart';

class AdditionalColors extends ThemeExtension<AdditionalColors> {
  const AdditionalColors({
    required this.additional1,
    required this.additional2,
    required this.additional3,
    required this.additional4,
  });

  final Color additional1;
  final Color additional2;
  final Color additional3;
  final Color additional4;

  @override
  ThemeExtension<AdditionalColors> copyWith({
    Color? additional1,
    Color? additional2,
    Color? additional3,
    Color? additional4,
  }) =>
      AdditionalColors(
        additional1: additional1 ?? this.additional1,
        additional2: additional2 ?? this.additional2,
        additional3: additional3 ?? this.additional3,
        additional4: additional4 ?? this.additional4,
      );

  @override
  ThemeExtension<AdditionalColors> lerp(
    covariant ThemeExtension<AdditionalColors>? other,
    double t,
  ) {
    if (other == null || other is! AdditionalColors) {
      return this;
    }
    return AdditionalColors(
      additional1: Color.lerp(additional1, other.additional1, t)!,
      additional2: Color.lerp(additional2, other.additional2, t)!,
      additional3: Color.lerp(additional3, other.additional3, t)!,
      additional4: Color.lerp(additional4, other.additional4, t)!,
    );
  }
}
