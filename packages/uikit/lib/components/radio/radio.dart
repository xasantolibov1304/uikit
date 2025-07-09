// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _radioSize = 10.0;

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
    super.key,
  });

  final bool value;
  final void Function(bool) onChanged;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: isEnabled ? () => onChanged(!value) : null,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3),
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: _borderColor(context),
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: _radioSize,
          height: _radioSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _radioColor(context),
          ),
        ),
      ),
    );
  }

  Color _radioColor(BuildContext context) {
    if (!isEnabled && value) {
      return context.borderColors.primary;
    }

    if (!isEnabled) {
      return context.systemColors.transparent;
    }

    return value
        ? context.borderColors.success
        : context.systemColors.transparent;
  }

  Color _borderColor(BuildContext context) {
    if (!isEnabled) {
      return context.borderColors.primary;
    }

    return value
        ? context.borderColors.success
        : context.borderColors.secondary;
  }
}
