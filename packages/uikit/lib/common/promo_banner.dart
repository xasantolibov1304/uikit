import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    required this.title,
    this.description,
    this.imageUrl,
    this.onClose,
    super.key,
  });

  final String title;
  final String? description;

  final String? imageUrl;

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.surfaceColors.error,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.titleTextStyle.medium1,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description ?? '',
                    style: context.subtitleTextStyle.medium2,
                  )
                ],
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.contain,
          ),
        ),
        if (onClose != null)
          Positioned(
            top: 16,
            right: 16,
            child: MyGestureDetector(
              onTap: onClose,
              child: UikitAssets.icons24.closeCircle.svg(),
            ),
          ),
      ],
    );
  }
}
