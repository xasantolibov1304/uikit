// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:uikit/common/bottom_sheets/cupertino_action_sheet/cupertino_action_item.dart';
import 'package:uikit/common/bottom_sheets/cupertino_action_sheet/cupertino_action_sheet.dart';

class CustomActionSheet {
  static Future<T?> showCupertinoActionSheet<T>(
    BuildContext context, {
    required List<CupertinoActionItem> actions,
    String? title,
    CupertinoActionItem? cancelButton,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CommonCupertinoActionSheet(
        title: title,
        actions: actions,
        cancelButton: cancelButton,
      ),
    );
  }
}
