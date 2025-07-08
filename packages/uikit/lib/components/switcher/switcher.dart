// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:iman_uikit/theme/color_theme_data.dart';

const _switchSize = Size(52, 32);

class Switcher extends StatelessWidget {
  const Switcher({
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
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: SizedBox(
        width: _switchSize.width,
        height: _switchSize.height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            thumbColor: context.systemColors.white,
            activeTrackColor: context.borderColors.success,
            inactiveTrackColor: context.surfaceColors.grey,
          ),
        ),
      ),
    );
  }
}
