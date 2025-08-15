// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/components/dropdown/dropdown.dart';
import 'package:iman_uikit/components/inputs/amount_input_field.dart';
import 'package:iman_uikit/components/inputs/currency/currency_type.dart';
import 'package:iman_uikit/components/inputs/input_field.dart';
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

class CurrencyInputField extends StatefulWidget {
  const CurrencyInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    //
    this.decimalPlaces = 0,
    this.initialSelectedCurrency,
    this.currencySymbol,
    this.currencyStyle,
    //
    this.captionIconPath,
    this.captionText,
    this.captionHelperText,
    //
    this.size = InputFieldSize.medium,
    //
    this.status = InputFieldStatus.info,
    //
    this.focusNode,
    //
    this.textInputAction = TextInputAction.done,
    //
    this.isLoading = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.readonly = false,
    this.isRequired = true,
    this.canClear = true,
    //
    this.onSelectCurrencyTap,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;

  final int decimalPlaces;
  final CurrencyType? initialSelectedCurrency;
  final String? currencySymbol;
  final TextStyle? currencyStyle;

  final InputFieldSize size;

  final String? captionIconPath;
  final String? captionText;
  final String? captionHelperText;

  final InputFieldStatus status;

  final FocusNode? focusNode;
  final TextInputAction textInputAction;

  final bool isLoading;
  final bool isEnabled;
  final bool autofocus;
  final bool readonly;
  final bool isRequired;
  final bool canClear;

  final void Function(CurrencyType)? onSelectCurrencyTap;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CurrencyInputField> createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  CurrencyType _selectedCurrency = CurrencyType.uzs;

  @override
  void initState() {
    super.initState();
    _selectedCurrency = widget.initialSelectedCurrency ?? CurrencyType.uzs;
  }

  void _updateState() => {if (mounted) setState(() {})};

  void _onCurrencyChanged(CurrencyType currency) {
    _selectedCurrency = currency;
    _updateState();
  }

  @override
  Widget build(BuildContext context) {
    return AmountInputField(
      size: widget.size,
      label: widget.label,
      status: widget.status,
      hintText: widget.hintText,
      readonly: widget.readonly,
      canClear: widget.canClear,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      captionText: widget.captionText,
      currency: widget.currencySymbol,
      initialValue: widget.initialValue,
      decimalPlaces: widget.decimalPlaces,
      currencyStyle: widget.currencyStyle,
      captionIconPath: widget.captionIconPath,
      captionHelperText: widget.captionHelperText,
      trailingIcon: widget.onSelectCurrencyTap != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1,
                  height: 24,
                  decoration: BoxDecoration(
                    color: context.textColors.muted,
                  ),
                ),
                const SizedBox(width: 12),
                CommonDropdown.builder(
                  minWidth: 96,
                  offset: Offset(0, 16),
                  itemCount: CurrencyType.values.length,
                  onSelected: (index) {
                    final selectedCurrency = CurrencyType.values[index];
                    _onCurrencyChanged(selectedCurrency);
                    widget.onSelectCurrencyTap?.call(selectedCurrency);
                  },
                  itemBuilder: (context, index, isSelected) {
                    final currencyType = CurrencyType.values[index];

                    return Row(
                      children: [
                        currencyType.icon,
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            currencyType.name,
                            style: context.subtitleTextStyle.medium2,
                          ),
                        ),
                      ],
                    );
                  },
                  child: Row(
                    children: [
                      _selectedCurrency.icon,
                      const SizedBox(width: 6),
                      Text(
                        _selectedCurrency.name,
                        style: context.titleTextStyle.main1,
                      ),
                      const SizedBox(width: 6),
                      UikitAssets.icons24.arrowDown.svg(),
                    ],
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
