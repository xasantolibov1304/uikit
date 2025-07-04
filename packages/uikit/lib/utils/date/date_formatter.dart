// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:intl/intl.dart';

const _ddMMyyyyDot = 'dd.MM.yyyy';
const _ddMMyyyySlash = 'dd/MM/yyyy';
const _ddMMyyyyHHmmSlash = 'dd/MM/yyyy HH:mm';
const _ddMMyyyyDash = 'dd-MM-yyyy';
const _hhmm = 'hh:mm';
const _hhmma = 'hh:mm a';

class MyDateFormatter {
  const MyDateFormatter._();

  /// e.g 22.10.24
  static String fddMMyyyyDot(DateTime? date) => format(date, _ddMMyyyyDot);
  static DateTime? pddMMyyyyDot(String? date) => parse(date, _ddMMyyyyDot);

  /// e.g 22-10-2024
  static String fddMMyyyyDash(DateTime? date) => format(date, _ddMMyyyyDash);
  static DateTime? pddMMyyyyDash(String? date) => parse(date, _ddMMyyyyDash);

  /// e.g 22/10/2024
  static String fddMMyyyySlash(DateTime? date) => format(date, _ddMMyyyySlash);
  static DateTime? pddMMyyyySlash(String? date) => parse(date, _ddMMyyyySlash);

  /// e.g 22/10/2024 22:00
  static String fddMMyyyyHHmmSlash(DateTime? date) =>
      format(date, _ddMMyyyyHHmmSlash);
  static DateTime? pddMMyyyyHHmmSlash(String? date) =>
      parse(date, _ddMMyyyyHHmmSlash);

  /// e.g 22:00
  static String fhhmm(DateTime? date) => format(date, _hhmm);
  static DateTime? phhmm(String? date) => parse(date, _hhmm);

  /// e.g 10:00 PM
  static String fhhmma(DateTime? date) => format(date, _hhmma);
  static DateTime? phhmma(String? date) => parse(date, _hhmma);

  ///
  /// Parse date from string
  ///
  static String format(DateTime? date, String newPattern) {
    if (date == null) return '';
    return DateFormat(newPattern).format(date);
  }

  static DateTime? parse(String? date, String newPattern) {
    if (date == null || date == '') return null;
    return DateFormat(newPattern).parse(date);
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  DateTextFormatter({String seperator = '.'}) : _seperator = seperator;

  final String _seperator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, _seperator);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
