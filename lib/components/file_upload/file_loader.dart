// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/file_upload/models/file_loader_item_model.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class FileLoader extends StatelessWidget {
  const FileLoader({
    required this.title,
    required this.selectFileText,
    required this.files,
    this.description,
    this.onSelectFile,
    this.maxFiles = 3,
    super.key,
  });

  final String title;
  final String? description;

  final List<FileLoaderItemModel> files;

  final String selectFileText;

  final VoidCallback? onSelectFile;

  final int maxFiles;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.surfaceColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.titleTextStyle.title3,
                ),
                if (description != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    description!,
                    style: context.baseTextStyle.base3.copyWith(
                      color: context.textColors.tertiary,
                    ),
                  ),
                ],
                if (files.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  ...List.generate(
                    files.length,
                    (index) => FileLoaderItem(
                      model: files[index],
                    ),
                  ),
                ],
                if (files.length < maxFiles) ...[
                  const SizedBox(height: 12),
                  _buildFileUpload(context),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUpload(BuildContext context) {
    return CommonGestureDetector(
      onTap: onSelectFile,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.surfaceColors.secondary,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.surfaceColors.primary,
                    ),
                    child: UikitAssets.icons24.fileUpload.svg(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    selectFileText,
                    style: context.baseTextStyle.base3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
