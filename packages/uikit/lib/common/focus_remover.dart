// Flutter imports:
import 'package:flutter/material.dart';

class FocusRemover extends StatelessWidget {
  const FocusRemover({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    );
  }
}
