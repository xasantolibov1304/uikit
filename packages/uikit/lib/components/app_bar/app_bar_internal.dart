import 'package:flutter/material.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class AppBarInternal extends StatelessWidget implements PreferredSizeWidget {
  const AppBarInternal.themed({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.onPop,
    this.backgroundColor,
    this.textColor,
    // this.iconColor,
    this.forceMaterialTransparency = true,
    super.key,
  }) : _isGradient = false;

  const AppBarInternal.themedWithoutMaterialTransparency({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.onPop,
    this.backgroundColor,
    this.textColor,
    // this.iconColor,
    this.forceMaterialTransparency = false,
    super.key,
  }) : _isGradient = false;

  const AppBarInternal.dark({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.actions,
    this.onPop,
    this.textColor,
    // this.iconColor,
    this.forceMaterialTransparency = true,
    super.key,
  }) : _isGradient = false;

  const AppBarInternal.transparent({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.textColor,
    // this.iconColor,
    this.actions,
    this.onPop,
    this.forceMaterialTransparency = true,
    super.key,
  })  : backgroundColor = Colors.transparent,
        _isGradient = false;

  const AppBarInternal.gradient({
    this.title,
    this.subtitle,
    this.leading,
    this.canPop = true,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.textColor,
    // this.iconColor,
    this.actions,
    this.onPop,
    this.forceMaterialTransparency = true,
    super.key,
  })  : backgroundColor = Colors.transparent,
        _isGradient = true;

  final String? title;
  final String? subtitle;
  final Widget? leading;

  final bool canPop;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  final List<Widget>? actions;

  final Color? backgroundColor;
  final Color? textColor;
  // final SvgColors? iconColor;

  final void Function()? onPop;

  final bool _isGradient;
  final bool forceMaterialTransparency;

  @override
  Widget build(BuildContext context) {
    if (_isGradient) {
      return Container(
        height: MediaQuery.of(context).padding.top + kToolbarHeight,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            colors: [
              const Color(0xFF151619),
              const Color(0xFF151619).withValues(alpha: 0),
            ],
          ),
        ),
        child: Row(
          children: [
            _leading(context),
            const SizedBox(width: 16),
            Row(
              children: [
                if (leading != null) ...[
                  Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: leading,
                  ),
                  const SizedBox(width: 12),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: context.titleTextStyle.main1.copyWith(
                          color: textColor,
                        ),
                      ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        maxLines: 1,
                        style: context.subtitleTextStyle.compact1,
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const Spacer(),
            if (actions != null) ...[
              ...actions!,
              const SizedBox(width: 16),
            ],
          ],
        ),
      );
    }
    return AppBar(
      elevation: 0,
      actions: actions,
      leadingWidth: 48,
      centerTitle: centerTitle,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor ?? context.backgroundColors.primary,
      forceMaterialTransparency: forceMaterialTransparency,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading ? _leading(context) : null,
      title: title == null
          ? null
          : Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: centerTitle
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: context.titleTextStyle.main1.copyWith(
                          color: textColor ?? context.textColors.primary,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          maxLines: 1,
                          style: context.subtitleTextStyle.compact1,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _leading(BuildContext context) {
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
