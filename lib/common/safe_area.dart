// Flutter imports:
import 'package:flutter/material.dart';

class MySafeArea extends StatelessWidget {
  const MySafeArea._({
    required this.top,
    required this.bottom,
    required this.height,
  });

  factory MySafeArea.b16() => const MySafeArea._(
        top: false,
        bottom: true,
        height: 16,
      );

  factory MySafeArea.b24() => const MySafeArea._(
        top: false,
        bottom: true,
        height: 24,
      );

  final bool top;
  final bool bottom;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: top,
      bottom: bottom,
      child: SizedBox(height: height),
    );
  }
}
