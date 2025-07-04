import 'package:iman_uikit/utils/date/date_formatter.dart';
import 'package:iman_uikit/utils/reg_exp_constants.dart';

const _pinflLength = 14;

class PassportDataUtil {
  const PassportDataUtil._();

  static bool isPinflValid(String pinfl) {
    if (pinfl.length != _pinflLength || !MyRegExps.onlyDigits.hasMatch(pinfl)) {
      return false;
    }
    final result = parsePinfl(pinfl);

    if (result.genderCenturyCode < 1 || result.genderCenturyCode > 6) {
      return false;
    }
    if (result.day < 1 ||
        result.day > 31 ||
        result.month < 1 ||
        result.month > 12) {
      return false;
    }

    const weights = [7, 3, 1];
    int sum = 0;
    for (int i = 0; i < 13; i++) {
      sum += int.parse(pinfl[i]) * weights[i % 3];
    }
    final calculatedControlDigit = sum % 10;

    return calculatedControlDigit == result.controlDigit;
  }

  static bool isPassportValid(String? number) {
    return MyRegExps.uzIdNumberRegExp.hasMatch(number ?? '');
  }

  static bool isPassportSerialValid(String? serial) {
    return MyRegExps.uzIdNumberSerialRegExp.hasMatch(serial ?? '');
  }

  static String getDateOfBirthByPinfl(String pinfl) {
    final result = parsePinfl(pinfl);

    return MyDateFormatter.fddMMyyyyDot(
      DateTime(result.year, result.month, result.day),
    );
  }

  static PinflDataEntity parsePinfl(String pinfl) {
    final genderCenturyCode = int.parse(pinfl.substring(0, 1));
    final day = int.parse(pinfl.substring(1, 3));
    final month = int.parse(pinfl.substring(3, 5));
    final year = int.parse(pinfl.substring(5, 7));
    int? controlDigit;
    if (pinfl.length == 14) {
      controlDigit = int.tryParse(pinfl.substring(13, 14));
    }

    return PinflDataEntity(
      genderCenturyCode: genderCenturyCode,
      day: day,
      month: month,
      digitYear: year,
      controlDigit: controlDigit,
    );
  }
}

class PinflDataEntity {
  PinflDataEntity({
    required this.genderCenturyCode,
    required this.day,
    required this.month,
    required this.digitYear,
    required this.controlDigit,
  });

  final int genderCenturyCode;
  final int day;
  final int month;
  final int digitYear;
  final int? controlDigit;

  /// returns valid year since [digitYear] is yy format
  int get year {
    if (genderCenturyCode == 1 || genderCenturyCode == 2) {
      return 1800 + digitYear;
    } else if (genderCenturyCode == 3 || genderCenturyCode == 4) {
      return 1900 + digitYear;
    }
    return 2000 + digitYear;
  }
}
