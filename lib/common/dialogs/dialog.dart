// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/dialogs/alert_dialog.dart';
import 'package:uikit/components/buttons/button.dart';

class CustomDialog {
  static Future<T?> showAlertDialog<T>(
    BuildContext context, {
    required String title,
    required String actionButtonText,
    required VoidCallback onAction,
    ButtonType actionButtonType = ButtonType.ghost,
    String? description,
    String? cancelButtonText,
    VoidCallback? onCancel,
    Axis axis = Axis.horizontal,
  }) {
    return showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) {
        return CustomAlertDialog(
          axis: axis,
          title: title,
          onAction: onAction,
          onCancel: onCancel,
          description: description,
          actionButtonType: actionButtonType,
          actionButtonText: actionButtonText,
          cancelButtonText: cancelButtonText,
        );
      },
    );
  }
}
