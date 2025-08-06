// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    this.size = 20,
    this.strokeWidth = 3,
    //
    this.color,
    this.margin = EdgeInsets.zero,
    //
    super.key,
  });

  final double? size;
  final double strokeWidth;

  final Color? color;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      child: CircularProgressIndicator(
        padding: EdgeInsets.zero,
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? context.iconColors.primary,
        ),
      ),
    );
  }
}
