// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/base/body_text_styles.dart';

const _fontFamily = 'AeonikPro';
const _fontPackage = 'uikit';

final lightBaseTextStyles = _generateTypographyFromBrightness(Brightness.light);
final darkBaseTextStyles = _generateTypographyFromBrightness(Brightness.dark);

BaseTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BaseTextStyles(
      base1: _baseTypography.copyWith(
        fontSize: 16,
        height: 20 / 16,
        color: lightTextColors.primary,
      ),
      base2: _baseTypography.copyWith(
        fontSize: 15,
        height: 20 / 15,
        color: lightTextColors.primary,
      ),
      base3: _baseTypography.copyWith(
        fontSize: 14,
        height: 18 / 14,
        color: lightTextColors.primary,
      ),
      base4: _baseTypography.copyWith(
        fontSize: 13,
        height: 16 / 13,
        color: lightTextColors.primary,
      ),
      base5: _baseTypography.copyWith(
        fontSize: 12,
        height: 14 / 12,
        color: lightTextColors.primary,
      ),
      base6: _baseTypography.copyWith(
        fontSize: 10,
        height: 12 / 10,
        color: lightTextColors.primary,
      ),
    );
  } else {
    return BaseTextStyles(
      base1: _baseTypography.copyWith(
        fontSize: 16,
        height: 20 / 16,
        color: darkTextColors.primary,
      ),
      base2: _baseTypography.copyWith(
        fontSize: 15,
        height: 20 / 15,
        color: darkTextColors.primary,
      ),
      base3: _baseTypography.copyWith(
        fontSize: 14,
        height: 18 / 14,
        color: darkTextColors.primary,
      ),
      base4: _baseTypography.copyWith(
        fontSize: 13,
        height: 16 / 13,
        color: darkTextColors.primary,
      ),
      base5: _baseTypography.copyWith(
        fontSize: 12,
        height: 14 / 12,
        color: darkTextColors.primary,
      ),
      base6: _baseTypography.copyWith(
        fontSize: 10,
        height: 12 / 10,
        color: darkTextColors.primary,
      ),
    );
  }
}

const _baseTypography = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: _fontFamily,
  package: _fontPackage,
  letterSpacing: 0,
);
