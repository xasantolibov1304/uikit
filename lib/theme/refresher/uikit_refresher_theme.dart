// Flutter imports:
import 'package:flutter/material.dart';

/// App-level look of the pull-to-refresh indicator ([CommonRefresher]).
///
/// Without it the refresher shows the standard spinner. Otherwise, in this
/// order of priority:
/// - [lottieAsset]: a Lottie animation played by [LottieLoader];
/// - [logo]: the app's logo animated by [LogoLoader].
///
/// ```dart
/// UikitTheme.light(
///   extensions: [
///     UikitRefresherTheme(lottieAsset: 'assets/lottie/logo.json'),
///   ],
/// );
/// ```
class UikitRefresherTheme extends ThemeExtension<UikitRefresherTheme> {
  const UikitRefresherTheme({
    this.lottieAsset,
    this.lottiePackage,
    this.lottieScrubOnPull = false,
    this.lottiePullEnd = 1,
    this.logo,
    this.color,
  });

  /// Lottie JSON asset shown inside the indicator (takes priority over [logo]).
  final String? lottieAsset;

  /// Package bundling [lottieAsset]; `null` for the app's own assets.
  final String? lottiePackage;

  /// `false` (default): the Lottie plays on its own as soon as the indicator
  /// appears and loops until the refresh completes.
  /// `true`: while pulling, the Lottie follows the finger up to
  /// [lottiePullEnd]; it loops only after release.
  final bool lottieScrubOnPull;

  /// Part of the Lottie timeline played while pulling when
  /// [lottieScrubOnPull] is `true` (see [LottieLoader.pullEnd]).
  final double lottiePullEnd;

  /// Logo shown inside the indicator. Any widget: `Image.asset`,
  /// `SvgPicture.asset`, … It is clipped to a circle.
  final Widget? logo;

  /// Color of the progress ring around the logo (and of the default
  /// spinner). Defaults to `context.iconColors.success`.
  final Color? color;

  @override
  UikitRefresherTheme copyWith({
    String? lottieAsset,
    String? lottiePackage,
    bool? lottieScrubOnPull,
    double? lottiePullEnd,
    Widget? logo,
    Color? color,
  }) {
    return UikitRefresherTheme(
      lottieAsset: lottieAsset ?? this.lottieAsset,
      lottiePackage: lottiePackage ?? this.lottiePackage,
      lottieScrubOnPull: lottieScrubOnPull ?? this.lottieScrubOnPull,
      lottiePullEnd: lottiePullEnd ?? this.lottiePullEnd,
      logo: logo ?? this.logo,
      color: color ?? this.color,
    );
  }

  @override
  UikitRefresherTheme lerp(
    covariant ThemeExtension<UikitRefresherTheme>? other,
    double t,
  ) {
    if (other is! UikitRefresherTheme) {
      return this;
    }
    final current = t < 0.5 ? this : other;
    return UikitRefresherTheme(
      lottieAsset: current.lottieAsset,
      lottiePackage: current.lottiePackage,
      lottieScrubOnPull: current.lottieScrubOnPull,
      lottiePullEnd: current.lottiePullEnd,
      logo: current.logo,
      color: Color.lerp(color, other.color, t),
    );
  }
}

extension UikitRefresherThemeDataExtension on ThemeData {
  UikitRefresherTheme? get refresherTheme => extension<UikitRefresherTheme>();
}
