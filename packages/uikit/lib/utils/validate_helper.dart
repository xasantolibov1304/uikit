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

  static bool isExpireDate(String value) =>
      MyRegExps.expirationDate.hasMatch(value);
}
