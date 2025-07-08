// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

enum PromoBannerType {
  filled,
  aside,
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    required this.title,
    this.description,
    this.imageUrl,
    this.onClose,
    this.height = 145,
    this.margin = EdgeInsets.zero,
    this.type = PromoBannerType.aside,
    super.key,
  });

  final String title;
  final String? description;
  final String? imageUrl;

  /// Show close button on the top right corner.
  final VoidCallback? onClose;

  /// [PromoBannerType.filled] - the banner has a background image.
  ///
  /// [PromoBannerType.aside] - the banner has a background image and a description.
  final PromoBannerType type;

  /// Default height of the banner is 145.
  final double height;

  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.backgroundColors.primary,
        border: Border.all(
          color: context.fieldColors.border,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          if (type == PromoBannerType.filled && imageUrl != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _cachedImageWidget,
              ),
            ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.titleTextStyle.medium1,
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            description ?? '',
                            style: context.subtitleTextStyle.medium2,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (type == PromoBannerType.aside && imageUrl != null)
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: height,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: _cachedImageWidget,
                    ),
                  ),
                ),
            ],
          ),
          if (onClose != null)
            Positioned(
              top: 16,
              right: 16,
              child: CommonGestureDetector(
                onTap: onClose,
                child: UikitAssets.icons24.closeCircle.svg(),
              ),
            ),
        ],
      ),
    );
  }

  Widget get _cachedImageWidget {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
    );
  }
}
