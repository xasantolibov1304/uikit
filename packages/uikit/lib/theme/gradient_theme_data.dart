// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/gradients/app_gradients.dart';
import 'package:iman_uikit/theme/gradients/background_gradients_theme.dart';
import 'package:iman_uikit/theme/gradients/button_gradients_theme.dart';
import 'package:iman_uikit/theme/gradients/card_gradients_theme.dart';
import 'package:iman_uikit/theme/gradients/shimmer_gradients_theme.dart';
import 'package:iman_uikit/theme/gradients/toast_gradients_theme.dart';

extension GradientThemeDataExtension on ThemeData {
  AppGradients get appGradients =>
      extension<AppGradients>() ??
      AppGradients(
        toast: lightToastGradients,
        shimmer: lightShimmerGradients,
        button: lightButtonGradients,
        background: lightBackgroundGradients,
        card: lightCardGradients,
      );
}

extension GradientThemeDataContextExtension on BuildContext {
  AppGradients get appGradients => Theme.of(this).appGradients;
}
