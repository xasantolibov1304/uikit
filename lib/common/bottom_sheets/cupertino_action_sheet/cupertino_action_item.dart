// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CupertinoActionItem extends StatelessWidget {
  const CupertinoActionItem({
    required this.label,
    required this.onPressed,
    this.textStyle,
    super.key,
  });

  final String label;
  final void Function() onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ??
            context.bodyTextStyle.medium2.copyWith(
              color: context.textColors.info,
            ),
      ),
    );
  }
}
