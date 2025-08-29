// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/text/text_colors_palette.dart';
import 'package:iman_uikit/theme/typographies/others/others_text_styles.dart';

const _fontFamily = 'Aeonik Pro';

final lightOthersTextStyles = _generateTypographyFromBrightness(Brightness.light);
final darkOthersTextStyles = _generateTypographyFromBrightness(Brightness.dark);

OthersTextStyles _generateTypographyFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return OthersTextStyles(
      cardBank: _baseTypography.copyWith(
        fontSize: 24,
        height: 28 / 24,
        color: lightTextColors.primary,
      ),
    );
  } else {
    return OthersTextStyles(
      cardBank: _baseTypography.copyWith(
        fontSize: 24,
        height: 28 / 24,
        color: darkTextColors.primary,
      ),
    );
  }
}

const _baseTypography = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: _fontFamily,
  letterSpacing: 0,
);
