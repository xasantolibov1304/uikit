// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:iman_uikit/common/bottom_sheets/cupertino_action_sheet/cupertino_action_item.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';

class CommonCupertinoActionSheet extends StatelessWidget {
  const CommonCupertinoActionSheet({
    required this.actions,
    this.title,
    this.cancelButton,
    super.key,
  });

  final String? title;

  final List<CupertinoActionItem> actions;
  final CupertinoActionItem? cancelButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(brightness: Brightness.light),
      child: CupertinoActionSheet(
        actions: actions,
        title: title != null
            ? Text(
                title!,
                style: context.titleTextStyle.large2,
              )
            : null,
        cancelButton: cancelButton,
      ),
    );
  }
}
