import 'package:flutter_multi_formatter/flutter_multi_formatter.dart'
    as formatter;

// Project imports:
import 'reg_exp_constants.dart';

abstract class MyValidationHelper {
  const MyValidationHelper._();

  static bool isEmail(String value) => MyRegExps.email.hasMatch(value);

  static bool isPassword(String value) => value.length >= 5;

  static bool isPhone(String value) => formatter.isPhoneValid(value);

  static bool isCardNumber(String value) =>
      formatter.isCardNumberValid(cardNumber: value);

  static bool isExpireDate(String value) {
    if (!MyRegExps.expirationDate.hasMatch(value)) return false;

    final parts = value.split('/');
    if (parts.length != 2) return false;

    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;

    final now = DateTime.now();
    final currentYear = now.year % 100;
    final currentMonth = now.month;

    if (year < currentYear) return false;
    if (year == currentYear && month < currentMonth) return false;

    return true;
  }
}
