// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSystemUiOverlayStyle {
  static void initialize(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      Theme.of(context).brightness == Brightness.light ? light : dark,
    );
  }

  static SystemUiOverlayStyle setOverlayStyleBrightness(Brightness brightness) {
    final overlayStyle = brightness == Brightness.light ? light : dark;
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    return overlayStyle;
  }

  static final dark = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark, // iOS only
    //
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  static final light = SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light, // iOS only
    //
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  );
}
