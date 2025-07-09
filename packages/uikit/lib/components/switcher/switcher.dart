// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';

const _switchSize = Size(52, 32);

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
    return Opacity(
      opacity: readonly ? 0.5 : 1,
      child: SizedBox(
        width: _switchSize.width,
        height: _switchSize.height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: CupertinoSwitch(
            value: value,
            onChanged: readonly || !isEnabled ? null : onChanged,
            thumbColor: isEnabled
                ? context.systemColors.white
                : context.borderColors.primary,
            activeTrackColor: isEnabled
                ? context.borderColors.success
                : context.surfaceColors.muted,
            inactiveTrackColor: isEnabled
                ? context.surfaceColors.muted
                : context.borderColors.secondary,
          ),
        ),
      ),
    );
  }
}
