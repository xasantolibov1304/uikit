// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class AppBarInternal extends StatelessWidget implements PreferredSizeWidget {
  const AppBarInternal({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.onPop,
    this.backgroundColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    // this.iconColor,
    this.forceMaterialTransparency = true,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;

  final bool canPop;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  final List<Widget>? actions;

  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  // final SvgColors? iconColor;

  final void Function()? onPop;

  final bool forceMaterialTransparency;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: actions,
      leadingWidth: 48,
      centerTitle: centerTitle,
      surfaceTintColor: Colors.transparent,
      forceMaterialTransparency: forceMaterialTransparency,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading ? _leading(context) : null,
      backgroundColor: backgroundColor ?? context.backgroundColors.primary,
      title: title == null
          ? null
          : Column(
              crossAxisAlignment: centerTitle
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: titleTextStyle ?? context.titleTextStyle.main1,
                ),
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    maxLines: 1,
                    style: subtitleTextStyle ?? context.subtitleTextStyle.main,
                  ),
                ],
              ],
            ),
    );
  }

  Widget _leading(BuildContext context) {
    if (leading != null && automaticallyImplyLeading) {
      return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: leading!,
      );
    }

    return canPop && Navigator.of(context).canPop()
        ? Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: onPop ?? () => Navigator.of(context).pop(),
              child: UikitAssets.icons24.chevronLeft.svg(
                colorFilter: ColorFilter.mode(
                  context.iconColors
                      .primary, //iconColor ?? context.iconColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
