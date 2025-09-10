// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _defaultSize = 44.0;
const _statusSize = 14.0;

enum AvatarType {
  placeholder,
  initials,
  image,
  icon,
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget.placeholder({
    this.statusIcon,
    this.isOnline = false,
    super.key,
  })  : type = AvatarType.placeholder,
        imageUrl = null,
        initials = null,
        icon = null;

  const AvatarWidget.initials({
    required this.initials,
    this.statusIcon,
    this.isOnline = false,
    super.key,
  })  : type = AvatarType.initials,
        imageUrl = null,
        icon = null;

  const AvatarWidget.image({
    required this.imageUrl,
    this.statusIcon,
    this.isOnline = false,
    super.key,
  })  : type = AvatarType.image,
        initials = null,
        icon = null;

  const AvatarWidget.icon({
    required this.icon,
    this.statusIcon,
    this.isOnline = false,
    super.key,
  })  : type = AvatarType.icon,
        imageUrl = null,
        initials = null;

  final String? imageUrl;
  final String? initials;
  final Widget? icon;

  final AvatarType type;

  final bool isOnline;
  final Widget? statusIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: _defaultSize,
              height: _defaultSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.surfaceColors.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _widget(context),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: isOnline
                  ? Container(
                      width: _statusSize,
                      height: _statusSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.additionalColors.additional4,
                        border: Border.all(
                          width: 2,
                          color: context.borderColors.invert,
                        ),
                      ),
                    )
                  : statusIcon ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _widget(BuildContext context) {
    return switch (type) {
      AvatarType.placeholder => UikitAssets.icons24.user.svg(),
      AvatarType.initials => Center(
          child: Text(
            initials ?? '',
            style: context.titleTextStyle.title3.copyWith(
              color: context.textColors.info,
            ),
          ),
        ),
      AvatarType.image => ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl!,
            width: _defaultSize,
            height: _defaultSize,
            errorWidget: (context, url, error) =>
                UikitAssets.icons24.user.svg(),
          ),
        ),
      AvatarType.icon => icon!,
    };
  }
}
