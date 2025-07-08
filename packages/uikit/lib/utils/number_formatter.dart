// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

abstract class NumberFormatterHelper {
  const NumberFormatterHelper._();

  static String? prettier(data, {int fractionDigits = 2}) {
    double? number = data is double ? data : double.tryParse('$data');
    if (number == null) return null;
    number = double.parse(number.toStringAsFixed(fractionDigits));

    final formatter = NumberFormat.decimalPattern('ru_RU');
    formatter.maximumFractionDigits = fractionDigits;
    return formatter.format(number);
  }

  static String? toCurrency(
    data, {
    int fractionDigits = 2,
    bool asDouble = false,
    String trailingSymbol = '',
    String leadingSymbol = '',
    ThousandSeparator separator = ThousandSeparator.Space,
  }) {
    if (data == null) return '';
    double? number = data is double ? data : double.tryParse('$data');
    if (number == null) return null;
    number = double.parse(number.toStringAsFixed(fractionDigits)) /
        (asDouble ? 100 : 1);
    return number.toCurrencyString(
      mantissaLength: fractionDigits,
      thousandSeparator: separator,
      leadingSymbol: leadingSymbol,
      trailingSymbol: trailingSymbol,
      useSymbolPadding: true,
    );
  }

  static String toFraction(
    double number, {
    int fractionDigits = 2,
    String currency = 'UZS',
  }) {
    final numberString = number.toStringAsFixed(0);
    final decimalPoints =
        numberString.substring(numberString.length - fractionDigits);

    return ' .$decimalPoints $currency';
  }

  static String toMaskedPan(String? pan) {
    if (pan == null || pan.isEmpty) return '';
    if (pan.length < 12) return pan;

    return '${pan.substring(0, 4)} ${pan.substring(4, 6)}** **** ${pan.substring(12)}';
  }
}
