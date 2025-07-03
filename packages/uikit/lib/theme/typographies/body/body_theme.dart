// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/body/body_text_styles.dart';

final lightBodyTextStyles = _generateTypographyFromBrightness(Brightness.light);
final darkBodyTextStyles = _generateTypographyFromBrightness(Brightness.dark);

BodyTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return BodyTextStyles(
    compact1: TextStyle(
      color: color,
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    compact2: TextStyle(
      color: color,
      fontSize: 14,
      height: 18 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    main: TextStyle(
      color: color,
      fontSize: 15,
      height: 20 / 15,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    medium1: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    medium2: TextStyle(
      color: color,
      fontSize: 16,
      height: 22 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    medium3: TextStyle(
      color: color,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    large: TextStyle(
      color: color,
      fontSize: 18,
      height: 22 / 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
  );
}
