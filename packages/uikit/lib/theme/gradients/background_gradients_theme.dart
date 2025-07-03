// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/gradients/background_gradient_colors_palette.dart';
import 'package:iman_uikit/theme/gradients/background_gradients.dart';

final lightBackgroundGradients =
    _generateGradientFromBrightness(Brightness.light);
final darkBackgroundGradients =
    _generateGradientFromBrightness(Brightness.dark);

BackgroundGradients _generateGradientFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BackgroundGradients(
      primary: LinearGradient(
        colors: [
          lightBackgroundGradientColors.primaryStart,
          lightBackgroundGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          lightBackgroundGradientColors.secondaryStart,
          lightBackgroundGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      accent: LinearGradient(
        colors: [
          lightBackgroundGradientColors.accentStart,
          lightBackgroundGradientColors.accentEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else {
    return BackgroundGradients(
      primary: LinearGradient(
        colors: [
          darkBackgroundGradientColors.primaryStart,
          darkBackgroundGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          darkBackgroundGradientColors.secondaryStart,
          darkBackgroundGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      accent: LinearGradient(
        colors: [
          darkBackgroundGradientColors.accentStart,
          darkBackgroundGradientColors.accentEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
