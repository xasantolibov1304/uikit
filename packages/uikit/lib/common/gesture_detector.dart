// Flutter imports:
import 'package:flutter/material.dart';

class CommonGestureDetector extends StatelessWidget {
  const CommonGestureDetector({
    required this.child,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final Widget? child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
