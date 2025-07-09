// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/buttons/gesture_detector.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _checkboxSize = 24.0;
const _animationDuration = Duration(milliseconds: 300);

enum CheckboxSize {
  small,
  medium,
}

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.isEnabled = true,
    this.size = CheckboxSize.medium,
    super.key,
  });

  final bool? value;
  final void Function(bool?) onChanged;
  final bool tristate;

  final bool isEnabled;

  final CheckboxSize size;

  @override
  Widget build(BuildContext context) {
    return CommonGestureDetector(
      onTap: isEnabled ? _onTap : null,
      child: Container(
        width: _checkboxSize,
        height: _checkboxSize,
        padding: EdgeInsets.all(size == CheckboxSize.small ? 2 : 0),
        child: AnimatedSwitcher(
          duration: _animationDuration,
          child: _buildCheckboxIcon(context),
        ),
      ),
    );
  }

  void _onTap() {
    if (tristate) {
      bool? newValue;
      if (value == false) {
        newValue = true;
      } else if (value == true) {
        newValue = null;
      } else {
        newValue = false;
      }
      onChanged(newValue);
    } else {
      onChanged(!(value ?? false));
    }
  }

  Widget _buildCheckboxIcon(BuildContext context) {
    if (value == null) {
      return UikitAssets.icons24.checkboxTristate.svg(
        colorFilter: ColorFilter.mode(
          isEnabled
              ? context.borderColors.success
              : context.borderColors.primary,
          BlendMode.srcIn,
        ),
      );
    } else if (value == true) {
      return UikitAssets.icons24.checkboxOn.svg(
        colorFilter: ColorFilter.mode(
          isEnabled
              ? context.borderColors.success
              : context.borderColors.primary,
          BlendMode.srcIn,
        ),
      );
    } else {
      return UikitAssets.icons24.checkboxOff.svg(
        colorFilter: ColorFilter.mode(
          isEnabled
              ? context.borderColors.secondary
              : context.borderColors.primary,
          BlendMode.srcIn,
        ),
      );
    }
  }
}
