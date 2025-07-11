// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:iman_uikit/utils/date/date_format_constants.dart';

class DateFormatterHelper {
  const DateFormatterHelper._();

  /// e.g 22.10.2024
  /// (dd.MM.yyyy)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fddMMyyyyDot(DateTime? date) => format(date, ddMMyyyyDot);
  static DateTime? pddMMyyyyDot(String? date) => parse(date, ddMMyyyyDot);

  /// e.g 22-10-2024
  /// (dd-MM-yyyy)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fddMMyyyyDash(DateTime? date) => format(date, ddMMyyyyDash);
  static DateTime? pddMMyyyyDash(String? date) => parse(date, ddMMyyyyDash);

  /// e.g 22/10/2024
  /// (dd/MM/yyyy)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fddMMyyyySlash(DateTime? date) => format(date, ddMMyyyySlash);
  static DateTime? pddMMyyyySlash(String? date) => parse(date, ddMMyyyySlash);

  /// e.g 22/10/2024 22:00
  /// (dd/MM/yyyy HH:mm)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fddMMyyyyHHmmSlash(DateTime? date) =>
      format(date, ddMMyyyyHHmmSlash);
  static DateTime? pddMMyyyyHHmmSlash(String? date) =>
      parse(date, ddMMyyyyHHmmSlash);

  /// e.g 22:00
  /// (hh:mm)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fHHmm(DateTime? date) => format(date, hhmm);
  static DateTime? pHHmm(String? date) => parse(date, hhmm);

  /// e.g 10:00 PM
  /// (hh:mm a)
  ///
  /// [format] - format the date
  /// [parse] - parse the date
  static String fhhmma(DateTime? date) => format(date, hhmma);
  static DateTime? phhmma(String? date) => parse(date, hhmma);

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
  DateTextFormatter({
    this.formatPattern = ddMMyyyyDot,
  });

  final String formatPattern;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return MaskedInputFormatter(dateFormatToMask[formatPattern] ?? '##.##.####')
        .formatEditUpdate(oldValue, newValue);
  }
}
