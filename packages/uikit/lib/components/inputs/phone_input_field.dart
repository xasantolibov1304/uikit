// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:iman_uikit/components/buttons/gesture_detector.dart';

// Project imports:
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/utils/string_helper.dart';

const _phoneCode = '998';
const _uzPhoneCode = 'UZ';
const _uzPhoneMask = '+000 00 000 00 00';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    required this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.isEnabled = true,
    this.readonly = false,
    this.autofocus = false,
    this.isRequired = true,
    this.canClear = false,
    this.isLoading = false,
    //
    this.focusNode,
    //
    this.leadingIcon,
    //
    this.onChanged,
    this.validator,
    this.onContactsTap,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final bool isEnabled;
  final bool readonly;
  final bool autofocus;
  final bool isRequired;
  final bool canClear;
  final bool isLoading;

  final FocusNode? focusNode;

  final Widget? leadingIcon;

  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onContactsTap;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  late TextEditingController controller;
  String? phoneCode = _phoneCode;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    _setMaskedInitPhone();
  }

  void _setMaskedInitPhone() {
    PhoneInputFormatter.replacePhoneMask(
      newMask: _uzPhoneMask,
      countryCode: _uzPhoneCode,
    );
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      final countyData = PhoneCodes.getCountryDataByPhone(widget.initialValue!);
      phoneCode = countyData!.phoneCode!;

      final phone = formatAsPhoneNumber(widget.initialValue!)!;
      final result = phone.replaceFirst('+$phoneCode', '');

      controller.text = result;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countryData = phoneCode != null
        ? PhoneCodes.getAllCountryDatasByPhoneCode(phoneCode!).firstOrNull
        : null;
    final hintText = countryData?.phoneMask?.replaceAll('0', '–');
    final mask = countryData != null ? PhoneInputFormatter() : null;

    return InputField(
      hintText: hintText,
      label: widget.label,
      controller: controller,
      readonly: widget.readonly,
      canClear: widget.canClear,
      isEnabled: widget.isEnabled,
      isLoading: widget.isLoading,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      validator: widget.validator,
      isRequired: widget.isRequired,
      leadingIcon: widget.leadingIcon,
      captionText: widget.captionText,
      keyboardType: TextInputType.phone,
      captionIconPath: widget.captionIconPath,
      captionHelperText: widget.captionHelperText,
      trailingIcon: widget.onContactsTap != null
          ? MyGestureDetector(
              onTap: widget.onContactsTap,
              child: UikitAssets.icons24.contact.svg(),
            )
          : null,
      inputFormatters: mask != null ? [mask] : null,
      onChanged: (value) {
        widget.onChanged?.call(
          MyStringHelper.removeNonNumbers('$phoneCode$value'),
        );
      },
    );
  }
}
