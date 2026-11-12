// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/common/common.dart';
import 'package:uikit/components/pincode/items/pin_display_item.dart';
import 'package:uikit/gen/assets.gen.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _kButtonSize = 80.0;

class Pincode extends StatefulWidget {
  const Pincode({
    this.length = 4,
    this.onCompleted,
    this.onChanged,
    this.showBiometric = false,
    this.onBiometricTap,
    this.errorMessage,
    super.key,
  });

  final int length;

  final void Function(String)? onCompleted;

  final void Function(String)? onChanged;

  final bool showBiometric;

  final VoidCallback? onBiometricTap;

  final String? errorMessage;

  @override
  State<Pincode> createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  late List<String> _pincode;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pincode = List.filled(widget.length, '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Spacer(),
        PinDisplayItem(
          pinLength: widget.length,
          activeIndex: _currentIndex,
          errorMessage: widget.errorMessage,
        ),
        Spacer(),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('1'),
            _buildKeypadButton('2'),
            _buildKeypadButton('3'),
          ],
        ),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('4'),
            _buildKeypadButton('5'),
            _buildKeypadButton('6'),
          ],
        ),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('7'),
            _buildKeypadButton('8'),
            _buildKeypadButton('9'),
          ],
        ),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBiometricButton(),
            _buildKeypadButton('0'),
            _buildDeleteButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildKeypadButton(String number) {
    return _pinButton(
      onTap: () => _onNumberPressed(number),
      child: Text(
        number,
        style: context.displayTextStyle.compact,
      ),
    );
  }

  Widget _buildBiometricButton() {
    if (!widget.showBiometric) {
      return const SizedBox(
        width: _kButtonSize,
        height: _kButtonSize,
      );
    }

    return _pinButton(
      color: Colors.transparent,
      onTap: () => widget.onBiometricTap?.call(),
      child: Icon(
        size: 32,
        Icons.fingerprint_outlined,
        color: context.iconColors.primary,
      ),
    );
  }

  Widget _buildDeleteButton() {
    return _pinButton(
      onTap: _onDeletePressed,
      onLongPress: _clearPincode,
      color: Colors.transparent,
      child: UikitAssets.icons32.backspace.svg(),
    );
  }

  Widget _pinButton({
    required Widget child,
    required VoidCallback onTap,
    VoidCallback? onLongPress,
    Color? color,
  }) {
    return CommonInkWell(
      onTap: onTap,
      width: _kButtonSize,
      height: _kButtonSize,
      onLongPress: onLongPress,
      splashColor: context.surfaceColors.grey,
      borderRadius: BorderRadius.circular(context.radii.full),
      color: color ?? context.surfaceColors.primary,
      child: Center(child: child),
    );
  }

  /// Methods

  void _onNumberPressed(String number) {
    if (_currentIndex < widget.length) {
      _pincode[_currentIndex] = number;
      _currentIndex++;

      final pincodeString = _pincode.join('');
      widget.onChanged?.call(pincodeString);

      if (_currentIndex == widget.length) {
        widget.onCompleted?.call(pincodeString);
      }
    }
  }

  void _onDeletePressed() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pincode[_currentIndex] = '';

      final pincodeString = _pincode.join('');
      widget.onChanged?.call(pincodeString);
    }
  }

  void _clearPincode() {
    _pincode = List.filled(widget.length, '');
    _currentIndex = 0;
    widget.onChanged?.call('');
  }
}
