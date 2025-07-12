// Flutter imports:
import 'package:flutter/material.dart';
import 'package:iman_uikit/common/bottom_sheets/scroll_indicator.dart';
import 'package:iman_uikit/common/gesture_detector.dart';

// Project imports:
import 'package:iman_uikit/common/safe_area.dart';
import 'package:iman_uikit/components/indicators/loading_indicator.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/utils/media_helper.dart';

class ScrollableBottomSheet extends StatelessWidget {
  const ScrollableBottomSheet({
    required this.children,
    this.title,
    this.slivers = const [],
    //
    this.hasIndicator = true,
    this.isLoading = false,
    //
    this.minChildSize = 0.5,
    this.maxChildSize = 0.95,
    this.initialChildSize = 0.95,
    //
    super.key,
  });

  final String? title;
  final List<Widget> children;
  final List<Widget> slivers;

  final bool hasIndicator;
  final bool isLoading;

  final double minChildSize;
  final double maxChildSize;
  final double initialChildSize;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaHelper.keybord(context);
    final isKeyboardVisible = bottom != 0;

    return DraggableScrollableSheet(
      expand: false,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      initialChildSize: isKeyboardVisible ? 0.95 : initialChildSize,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      if (hasIndicator) const ScrollIndicator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (title != null) ...[
                            Expanded(
                              child: Text(
                                title!,
                                textAlign: TextAlign.center,
                                style: context.titleTextStyle.large1,
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                          CommonGestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: UikitAssets.icons32.closeCircle.svg(),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Stack(
                          children: [
                            CustomScrollView(
                              controller: controller,
                              slivers: [
                                ...slivers,
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      ...children,
                                      MySafeArea.b24(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            if (isLoading)
                              const Center(child: LoadingIndicator()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isKeyboardVisible ? SizedBox(height: bottom) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
