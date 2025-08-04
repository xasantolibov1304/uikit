// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommonRichText extends StatelessWidget {
  const CommonRichText({
    required this.text1,
    required this.text2,
    //
    required this.style1,
    required this.style2,
    //
    this.onFirstTap,
    this.onSecondTap,
    this.textAlign,
    //
    super.key,
  });

  final String text1;
  final String text2;

  final TextStyle style1;
  final TextStyle style2;

  final void Function()? onFirstTap;
  final void Function()? onSecondTap;

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: style1,
            recognizer: _recognizer1,
          ),
          TextSpan(
            text: text2,
            style: style2,
            recognizer: _recognizer2,
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }

  GestureRecognizer? get _recognizer1 {
    if (onFirstTap != null) {
      return TapGestureRecognizer()..onTap = onFirstTap;
    } else {
      return null;
    }
  }

  GestureRecognizer? get _recognizer2 {
    if (onSecondTap != null) {
      return TapGestureRecognizer()..onTap = onSecondTap;
    } else {
      return null;
    }
  }
}
