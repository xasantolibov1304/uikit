// Flutter imports:
import 'package:flutter/material.dart';

class CommonInkWell extends StatelessWidget {
  const CommonInkWell({
    required this.child,
    this.onTap,
    //
    this.color,
    this.gradient,
    this.boxShadow,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    //
    this.onLongPress,
    this.onDoubleTap,
    //
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    //
    this.border,
    this.borderRadius,
    //
    this.height,
    this.width,
    this.alignment,
    this.focusNode,
    super.key,
  });

  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onDoubleTap;

  final BorderRadius? borderRadius;
  final BoxBorder? border;

  final Color? color;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final double? height;
  final double? width;

  final Alignment? alignment;

  final Widget child;

  final Color? splashColor;
  final Color? hoverColor;
  final Color? focusColor;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        border: border,
        gradient: gradient,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          focusNode: focusNode,
          hoverColor: hoverColor,
          focusColor: focusColor,
          onLongPress: onLongPress,
          onDoubleTap: onDoubleTap,
          splashColor: splashColor,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
