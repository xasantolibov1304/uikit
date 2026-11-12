// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/components/indicators/common_linear_progress_indicator.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

class FileLoaderItemModel {
  const FileLoaderItemModel({
    required this.fileName,
    required this.progress,
    required this.progressType,
    required this.statusText,
    this.showProgress = false,
    this.trailingIcon,
    this.onClose,
  });

  final String fileName;

  final bool showProgress;
  final double progress;
  final LinearProgressIndicatorType progressType;

  final String statusText;

  final Widget? trailingIcon;
  final VoidCallback? onClose;
}

class FileLoaderItem extends StatelessWidget {
  const FileLoaderItem({
    required this.model,
    super.key,
  });

  final FileLoaderItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.baseTextStyle.base3,
                ),
                if (model.showProgress && model.progress != 1) ...[
                  const SizedBox(height: 4),
                  CommonLinearProgressIndicator(
                    percent: model.progress,
                    type: model.progressType,
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  model.statusText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.baseTextStyle.base5.copyWith(
                    color: model.showProgress && model.progress == 1
                        ? context.textColors.success
                        : context.textColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          if (model.trailingIcon != null) ...[
            SizedBox(width: 8),
            CommonGestureDetector(
              onTap: model.onClose,
              child: model.trailingIcon!,
            ),
          ],
        ],
      ),
    );
  }
}
