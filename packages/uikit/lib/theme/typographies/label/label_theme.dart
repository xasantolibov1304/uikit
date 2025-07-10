// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/label/label_text_styles.dart';

final lightLabelTextStyles =
    _generateTypographyFromBrightness(Brightness.light);
final darkLabelTextStyles = _generateTypographyFromBrightness(Brightness.dark);

LabelTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return LabelTextStyles(
    main1: TextStyle(
      color: color,
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    main2: TextStyle(
      color: color,
      fontSize: 13,
      height: 16 / 13,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    medium1: TextStyle(
      color: color,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    medium2: TextStyle(
      color: color,
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    large: TextStyle(
      color: color,
      fontSize: 16,
      height: 20 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
  );
}
