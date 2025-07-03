// Flutter imports:
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );
  TextStyle get medium => copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );
  TextStyle get semibold => copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );
  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );
}
