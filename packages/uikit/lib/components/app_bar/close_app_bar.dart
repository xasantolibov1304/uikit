import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iman_uikit/theme/system_overlay.dart';

enum _AppBarStyle {
  light,
  dark,
  themed,
}

class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoAppBar.light({super.key}) : _style = _AppBarStyle.light;

  const NoAppBar.dark({super.key}) : _style = _AppBarStyle.dark;

  const NoAppBar.themed({super.key}) : _style = _AppBarStyle.themed;

  final _AppBarStyle _style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      systemOverlayStyle: _overlayStyle(context),
    );
  }

  SystemUiOverlayStyle _overlayStyle(BuildContext context) {
    switch (_style) {
      case _AppBarStyle.light:
        return AppSystemUiOverlayStyle.light;
      case _AppBarStyle.dark:
        return AppSystemUiOverlayStyle.dark;
      case _AppBarStyle.themed:
        return Theme.of(context).brightness == Brightness.light
            ? AppSystemUiOverlayStyle.light
            : AppSystemUiOverlayStyle.dark;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
