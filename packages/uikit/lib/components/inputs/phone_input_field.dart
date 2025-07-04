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
    required this.onChanged,
    this.initialValue,
    //
    this.focusNode,
    //
    this.captionText,
    this.captionHelperText,
    this.captionIconPath,
    //
    this.isLoading = false,
    this.isRequired = true,
    this.autofocus = false,
    this.isEnabled = true,
    this.readonly = false,
    this.leadingIcon,
    this.validator,
    this.onContactsTap,
    super.key,
  });

  final String label;
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  final FocusNode? focusNode;

  final String? captionText;
  final String? captionHelperText;
  final String? captionIconPath;

  final bool isLoading;
  final bool isEnabled;
  final bool autofocus;
  final bool readonly;
  final bool isRequired;

  final String? Function(String?)? validator;

  final Widget? leadingIcon;

  final VoidCallback? onContactsTap;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  //
  final controller = TextEditingController();
  String? phoneCode = _phoneCode;

  @override
  void initState() {
    super.initState();
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
