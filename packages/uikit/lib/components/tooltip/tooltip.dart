import 'package:flutter/material.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation '
          'ullamco laboris nisi ut aliquip ex ea commodo consequat',
      showDuration: Duration(seconds: 10),
      decoration: BoxDecoration(
        color: context.borderColors.black,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      textStyle: TextStyle(color: Colors.white),
      preferBelow: true,
      verticalOffset: 10,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.info, size: 30.0),
      ),
    );
  }
}
