// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:iman_uikit/utils/validation_helper.dart';
import 'reg_exp_constants.dart';

abstract class StringHelper {
  const StringHelper._();

  static String removeNonNumbers(String data) {
    return data.replaceAll(CommonRegExps.nonDigit, '');
  }

  static String phoneMask(String? data, {bool obfuscate = false}) {
    if (data == null) return '';

    String text = removeNonNumbers(data);
    if (!ValidationHelper.isPhone(text)) return data;

    final mask = formatAsPhoneNumber(text)!;
    if (obfuscate) {
      return '+${mask.substring(1, 4)} ** *** ${mask.substring(11)}';
    }
    return mask;
  }

  static String expireDateMask(String? data) {
    if (data == null) return '';

    String text = removeNonNumbers(data);

    if (text.length < 4) return data;

    final month = text.substring(2);
    final year = text.substring(0, 2);

    return '$month/$year';
  }

  static String clearHTTPS(String data) {
    return data.replaceAll('https://', '').replaceAll('http://', '').trim();
  }

  static String compactNumber(int count) =>
      NumberFormat.compact().format(count);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
