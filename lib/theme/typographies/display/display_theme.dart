// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';
import 'package:iman_uikit/theme/typographies/display/display_text_styles.dart';

final lightDisplayTextStyle =
    _generateTypographyFromBrightness(Brightness.light);
final darkDisplayTextStyle = _generateTypographyFromBrightness(Brightness.dark);

DisplayTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  final color = brightness == Brightness.light
      ? lightTextColors.primary
      : darkTextColors.primary;
  return DisplayTextStyles(
    compact: TextStyle(
      color: color,
      fontSize: 28,
      height: 32 / 28,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),
    main: TextStyle(
      color: color,
      fontSize: 36,
      height: 40 / 36,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),
    large: TextStyle(
      color: color,
      fontSize: 44,
      height: 52 / 44,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),
  );
}
