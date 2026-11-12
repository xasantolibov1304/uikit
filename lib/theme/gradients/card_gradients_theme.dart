// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/card_gradient_colors_palette.dart';
import 'package:uikit/theme/gradients/card_gradients.dart';

final lightCardGradients = _generateGradientFromBrightness(Brightness.light);
final darkCardGradients = _generateGradientFromBrightness(Brightness.dark);

CardGradients _generateGradientFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return CardGradients(
      primary: LinearGradient(
        colors: [
          lightCardGradientColors.primaryStart,
          lightCardGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          lightCardGradientColors.secondaryStart,
          lightCardGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      accent: LinearGradient(
        colors: [
          lightCardGradientColors.accentStart,
          lightCardGradientColors.accentEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else {
    return CardGradients(
      primary: LinearGradient(
        colors: [
          darkCardGradientColors.primaryStart,
          darkCardGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          darkCardGradientColors.secondaryStart,
          darkCardGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      accent: LinearGradient(
        colors: [
          darkCardGradientColors.accentStart,
          darkCardGradientColors.accentEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
