// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({
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
    return Center(
      child: Container(
        width: size,
        height: size,
        margin: margin,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          strokeCap: StrokeCap.round,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? context.systemColors.black,
          ),
        ),
      ),
    );
  }
}
