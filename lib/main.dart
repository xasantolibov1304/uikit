// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:uikit/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().config();

    return DevicePreview(
      enabled: kReleaseMode,
      builder: (BuildContext context) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          theme: uikit.lightTheme,
          darkTheme: uikit.darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
