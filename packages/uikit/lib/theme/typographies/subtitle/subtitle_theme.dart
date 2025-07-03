// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/subtitle/subtitle_text_styles.dart';

final lightSubtitleTextStyles =
    _generateTypographyFromBrightness(Brightness.light);
final darkSubtitleTextStyles =
    _generateTypographyFromBrightness(Brightness.dark);

SubtitleTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return SubtitleTextStyles(
    compact1: TextStyle(
      color: color,
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    compact2: TextStyle(
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
      color: color,
    ),
    main: TextStyle(
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      color: color,
    ),
    medium1: TextStyle(
      color: color,
      fontSize: 14,
      height: 18 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    medium2: TextStyle(
      color: color,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    large1: TextStyle(
      color: color,
      fontSize: 15,
      height: 20 / 15,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    large2: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
  );
}
