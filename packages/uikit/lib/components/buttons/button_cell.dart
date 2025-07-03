// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/common/text_highlight.dart';
import 'package:iman_uikit/components/buttons/button.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _iconSize = 20.0;

class ButtonCell extends StatelessWidget {
  const ButtonCell({
    this.primaryText,
    this.onPrimaryTap,
    this.secondaryText,
    this.onSecondaryTap,
    this.tertiaryText,
    this.onTertiaryTap,
    //
    this.direction = Axis.vertical,
    //
    this.captionText,
    this.captionHighlight,
    this.onCaptionTap,
    //
    this.anchorTitle,
    this.anchorIcon,
    this.onAnchorTap,
    //
    this.informativeTitle,
    this.informativeIcon,
    //
    super.key,
  });

  final String? primaryText;
  final String? secondaryText;
  final String? tertiaryText;

  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;
  final VoidCallback? onTertiaryTap;

  final Axis direction;

  final String? captionText;
  final String? captionHighlight;
  final VoidCallback? onCaptionTap;

  final String? anchorTitle;
  final Widget? anchorIcon;
  final VoidCallback? onAnchorTap;

  final String? informativeTitle;
  final Widget? informativeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.backgroundColors.primary,
      ),
      child: Column(
        children: [
          if (captionText != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextHighlight(
                text: captionText!,
                onHighlightTap: onCaptionTap,
                textStyle: context.label.main,
                highlights: [captionHighlight ?? ''],
                highlightStyle: context.label.medium1.copyWith(
                  color: context.textColors.info,
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
          if (anchorTitle != null) ...[
            _AnchorWidget(
              title: anchorTitle!,
              onTap: onAnchorTap,
              icon: anchorIcon,
            ),
            SizedBox(height: 8),
          ],
          _ButtonWidget(
            direction: direction,
            primaryText: primaryText,
            onPrimaryTap: onPrimaryTap,
            secondaryText: secondaryText,
            onSecondaryTap: onSecondaryTap,
            tertiaryText: tertiaryText,
            onTertiaryTap: onTertiaryTap,
          ),
          if (informativeTitle != null) ...[
            SizedBox(height: 8),
            _InformativeWidget(
              title: informativeTitle!,
              icon: informativeIcon,
            ),
          ],
        ],
      ),
    );
  }
}

class _AnchorWidget extends StatelessWidget {
  const _AnchorWidget({
    required this.title,
    required this.onTap,
    this.icon,
  });

  final String title;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MyGestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.label.medium1,
            ),
            if (icon != null) ...[
              SizedBox(width: 6),
              SizedBox(
                width: _iconSize,
                height: _iconSize,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: icon!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    required this.primaryText,
    required this.onPrimaryTap,
    required this.secondaryText,
    required this.onSecondaryTap,
    required this.tertiaryText,
    required this.onTertiaryTap,
    this.direction = Axis.vertical,
  });

  final String? primaryText;
  final VoidCallback? onPrimaryTap;

  final String? secondaryText;
  final VoidCallback? onSecondaryTap;

  final String? tertiaryText;
  final VoidCallback? onTertiaryTap;

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        direction == Axis.vertical
            ? Column(
                children: [
                  if (primaryText != null) ...[
                    Button(
                      text: primaryText!,
                      onTap: onPrimaryTap,
                    ),
                  ],
                  if (secondaryText != null) ...[
                    SizedBox(height: 8),
                    Button(
                      text: secondaryText!,
                      onTap: onSecondaryTap,
                      type: ButtonType.secondary,
                    ),
                  ],
                ],
              )
            : Row(
                children: [
                  if (primaryText != null) ...[
                    Expanded(
                      child: Button(
                        text: primaryText!,
                        onTap: onPrimaryTap,
                      ),
                    ),
                  ],
                  if (secondaryText != null) ...[
                    SizedBox(width: 8),
                    Expanded(
                      child: Button(
                        text: secondaryText!,
                        onTap: onSecondaryTap,
                        type: ButtonType.secondary,
                      ),
                    ),
                  ],
                ],
              ),
        if (tertiaryText != null) ...[
          SizedBox(height: 8),
          Button(
            text: tertiaryText!,
            type: ButtonType.ghost,
            size: ButtonSize.small,
            onTap: onTertiaryTap,
          ),
        ],
      ],
    );
  }
}

class _InformativeWidget extends StatelessWidget {
  const _InformativeWidget({
    required this.title,
    this.icon,
  });

  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            SizedBox(
              width: _iconSize,
              height: _iconSize,
              child: FittedBox(
                fit: BoxFit.cover,
                child: icon!,
              ),
            ),
            SizedBox(width: 6),
          ],
          Text(
            title,
            style: context.label.medium1,
          ),
        ],
      ),
    );
  }
}
