// Flutter imports:
import 'package:flutter/material.dart';

class DisplayTextStyles extends ThemeExtension<DisplayTextStyles> {
  const DisplayTextStyles({
    required this.display1,
    required this.display2,
    required this.display3,
    required this.display4,
    required this.display5,
  });

  /// Display 1: fontSize: 44, height: 44, weight: 700
  final TextStyle display1;

  /// Display 2: fontSize: 40, height: 40, weight: 700
  final TextStyle display2;

  /// Display 3: fontSize: 36, height: 38, weight: 700
  final TextStyle display3;

  /// Display 4: fontSize: 32, height: 36, weight: 700
  final TextStyle display4;

  /// Display 5: fontSize: 28, height: 32, weight: 700
  final TextStyle display5;

  // Backward compatibility properties
  TextStyle get large => display1;
  TextStyle get compact => display5;

  @override
  ThemeExtension<DisplayTextStyles> copyWith({
    TextStyle? display1,
    TextStyle? display2,
    TextStyle? display3,
    TextStyle? display4,
    TextStyle? display5,
  }) {
    return DisplayTextStyles(
      display1: display1 ?? this.display1,
      display2: display2 ?? this.display2,
      display3: display3 ?? this.display3,
      display4: display4 ?? this.display4,
      display5: display5 ?? this.display5,
    );
  }

  @override
  ThemeExtension<DisplayTextStyles> lerp(
    covariant ThemeExtension<DisplayTextStyles>? other,
    double t,
  ) {
    if (other == null || other is! DisplayTextStyles) return this;
    return DisplayTextStyles(
      display1: TextStyle.lerp(display1, other.display1, t)!,
      display2: TextStyle.lerp(display2, other.display2, t)!,
      display3: TextStyle.lerp(display3, other.display3, t)!,
      display4: TextStyle.lerp(display4, other.display4, t)!,
      display5: TextStyle.lerp(display5, other.display5, t)!,
    );
  }
}
