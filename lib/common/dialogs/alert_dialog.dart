// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/components/buttons/button.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.description,
    required this.actionButtonText,
    required this.onAction,
    this.actionButtonType = ButtonType.ghost,
    this.cancelButtonText,
    this.onCancel,
    this.axis = Axis.horizontal,
    super.key,
  });

  final String title;
  final String? description;

  final Axis axis;

  final String actionButtonText;
  final VoidCallback onAction;
  final ButtonType actionButtonType;

  final String? cancelButtonText;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 32,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.radii.xl),
      ),
      backgroundColor: context.surfaceColors.elevated,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.titleTextStyle.title3,
            ),
            if (description != null) ...[
              SizedBox(height: 8),
              Text(
                description!,
                style: context.baseTextStyle.base3.copyWith(
                  color: context.textColors.secondary,
                ),
              ),
            ],
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flex(
                  direction: axis,
                  children: [
                    if (cancelButtonText != null) ...[
                      _buttonWidget(
                        onTap: onCancel,
                        text: cancelButtonText!,
                      ),
                      SizedBox(height: 8, width: 8),
                    ],
                    _buttonWidget(
                      onTap: onAction,
                      text: actionButtonText,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget({
    required String text,
    required VoidCallback? onTap,
  }) {
    return Button(
      text: text,
      onTap: onTap,
      size: ButtonSize.small,
      type: ButtonType.ghost,
    );
  }
}
