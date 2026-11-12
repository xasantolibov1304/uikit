// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/gradients.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  const AppGradients({
    required this.toast,
    required this.shimmer,
    required this.button,
    required this.background,
    required this.card,
  });

  final ToastGradients toast;
  final ShimmerGradients shimmer;
  final ButtonGradients button;
  final BackgroundGradients background;
  final CardGradients card;

  @override
  ThemeExtension<AppGradients> copyWith({
    ToastGradients? toast,
    ShimmerGradients? shimmer,
    ButtonGradients? button,
    BackgroundGradients? background,
    CardGradients? card,
  }) {
    return AppGradients(
      toast: toast ?? this.toast,
      shimmer: shimmer ?? this.shimmer,
      button: button ?? this.button,
      background: background ?? this.background,
      card: card ?? this.card,
    );
  }

  @override
  AppGradients lerp(
    covariant ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other == null || other is! AppGradients) {
      return this;
    }

    return AppGradients(
      toast: toast.lerp(other.toast, t),
      shimmer: shimmer.lerp(other.shimmer, t),
      button: button.lerp(other.button, t),
      background: background.lerp(other.background, t),
      card: card.lerp(other.card, t),
    );
  }
}
