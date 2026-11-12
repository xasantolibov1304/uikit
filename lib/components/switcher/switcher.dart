// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/common/gesture_detector.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _switchWidth = 68.0;
const _switchHeight = 32.0;

const _thumbWidth = 40.0;
const _thumbHeight = 28.0;
const _thumbPadding = 2.0;

const _animationDuration = Duration(milliseconds: 200);

class Switcher extends StatelessWidget {
  const Switcher({
    required this.value,
    required this.onChanged,
    this.readonly = false,
    this.isEnabled = true,
    super.key,
  });

  final bool value;
  final void Function(bool) onChanged;

  final bool readonly;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final trackColor = value
        ? (isEnabled
            ? context.borderColors.success
            : context.surfaceColors.muted)
        : (isEnabled
            ? context.surfaceColors.muted
            : context.borderColors.secondary);
    final thumbColor =
        isEnabled ? context.systemColors.white : context.borderColors.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: readonly ? 0.5 : 1.0,
          child: CommonGestureDetector(
            onTap: (readonly || !isEnabled) ? null : () => onChanged(!value),
            child: AnimatedContainer(
              width: _switchWidth,
              height: _switchHeight,
              duration: _animationDuration,
              padding: const EdgeInsets.all(_thumbPadding),
              decoration: BoxDecoration(
                color: trackColor,
                borderRadius: BorderRadius.circular(_switchHeight / 2),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    curve: Curves.easeInOut,
                    duration: _animationDuration,
                    alignment:
                        value ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: _thumbWidth,
                      height: _thumbHeight,
                      decoration: BoxDecoration(
                        color: thumbColor,
                        borderRadius: BorderRadius.circular(_thumbHeight / 2),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                            color: Colors.black.withValues(alpha: 0.15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
