// Flutter imports:
import 'package:flutter/material.dart';

class MyGestureDetector extends StatelessWidget {
  const MyGestureDetector({
    required this.child,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
