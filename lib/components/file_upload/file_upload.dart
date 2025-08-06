// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/indicators/progress_indicator.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';
import 'package:iman_uikit/utils/file_helper.dart';

const _iconSize = 40.0;

@Deprecated('Use FileLoader instead')
class FileUpload extends StatelessWidget {
  const FileUpload({
    required this.fileName,
    this.fileSize,
    this.percentage,
    this.trailing,
    super.key,
  });

  final String fileName;
  final String? fileSize;

  final double? percentage;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.backgroundColors.primary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.borderColors.primary,
        ),
      ),
      child: Row(
        children: [
          _fileIcon(context),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: context.titleTextStyle.compact1,
                ),
                if (percentage != null) ...[
                  const SizedBox(height: 8),
                  CommonProgressIndicator(
                    percentage: percentage!,
                  ),
                ] else ...[
                  const SizedBox(height: 4),
                  Text(
                    fileSize ?? '',
                    style: context.bodyTextStyle.compact2.copyWith(
                      color: context.textColors.tertiary,
                    ),
                  ),
                ]
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 16),
            trailing!,
          ],
        ],
      ),
    );
  }

  Widget _fileIcon(BuildContext context) {
    return switch (FileHelper.getFileType(fileName)) {
      FileType.pdf => UikitAssets.icons40.pdfFile.svg(),
      FileType.doc => UikitAssets.icons40.docFile.svg(),
      FileType.xlsx => UikitAssets.icons40.xlsxFile.svg(),
      FileType.jpeg => UikitAssets.icons40.jpegFile.svg(),
      FileType.jpg => UikitAssets.icons40.jpegFile.svg(),
      FileType.png => UikitAssets.icons40.pngFile.svg(),
      FileType.other => Container(
          width: _iconSize,
          height: _iconSize,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.backgroundColors.secondary,
            border: Border.all(
              color: context.borderColors.primary,
            ),
          ),
          child: UikitAssets.icons20.iconPlaceholder.svg(),
        )
    };
  }
}
