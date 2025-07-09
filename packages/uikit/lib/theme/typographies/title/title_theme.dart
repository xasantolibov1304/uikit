// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/title/title_text_styles.dart';

final lightTitleTextStyles =
    _generateTypographyFromBrightness(Brightness.light);
final darkTitleTextStyles = _generateTypographyFromBrightness(Brightness.dark);

TitleTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return TitleTextStyles(
    compact1: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    compact2: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    main1: TextStyle(
      color: color,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    main2: TextStyle(
      color: color,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    medium1: TextStyle(
      color: color,
      fontSize: 18,
      height: 20 / 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    medium2: TextStyle(
      color: color,
      fontSize: 18,
      height: 22 / 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    medium3: TextStyle(
      color: color,
      fontSize: 18,
      height: 24 / 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    large1: TextStyle(
      color: color,
      fontSize: 20,
      height: 24 / 20,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    large2: TextStyle(
      color: color,
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    extraLarge: TextStyle(
      color: color,
      fontSize: 32,
      height: 36 / 32,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
  );
}
