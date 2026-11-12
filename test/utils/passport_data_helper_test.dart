// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:uikit/utils/passport_data_helper.dart';

void main() {
  group('Pinfl Tests', () {
    test('isPinflValid returns true for valid PINFL', () {
      const pinfl = '30101800050015';
      final result = PassportDataUtil.isPinflValid(pinfl);
      expect(result, isTrue);
    });

    test('isPinflValid returns false for invalid PINFL length', () {
      const pinfl = '123456789123';
      final result = PassportDataUtil.isPinflValid(pinfl);
      expect(result, isFalse);
    });

    test('isPinflValid returns false for invalid genderCenturyCode', () {
      const pinfl = '60101800050015';
      final result = PassportDataUtil.isPinflValid(pinfl);
      expect(result, isFalse);
    });

    test('isPinflValid returns false for invalid day or month', () {
      const pinfl = '30202800050015';
      final result = PassportDataUtil.isPinflValid(pinfl);
      expect(result, isFalse);
    });

    test('isPinflValid returns false for invalid control digit', () {
      const pinfl = '30101800050014';
      final result = PassportDataUtil.isPinflValid(pinfl);
      expect(result, isFalse);
    });

    test('getDateOfBirthByPinfl returns correct date for valid PINFL', () {
      const pinfl = '30101800050015';
      final dob = PassportDataUtil.getDateOfBirthByPinfl(pinfl);
      expect(dob, '01.01.1980');
    });

    test('parsePinfl returns correct PinflDataEntity', () {
      const pinfl = '30101800050015';
      final entity = PassportDataUtil.parsePinfl(pinfl);
      expect(entity.genderCenturyCode, 3);
      expect(entity.day, 01);
      expect(entity.month, 01);
      expect(entity.digitYear, 80);
      expect(entity.controlDigit, 5);
    });

    test('PinflDataEntity year returns correct year based on century code', () {
      final entity = PinflDataEntity(
        genderCenturyCode: 3,
        day: 01,
        month: 01,
        digitYear: 80,
        controlDigit: 5,
      );
      expect(entity.year, 1980);
    });
  });

  group('Passport Test', () {
    test('isPassportSerialValid returns true for valid serial', () {
      const serial = 'AB1234567';
      final result = PassportDataUtil.isPassportSerialValid(serial);
      expect(result, isTrue);
    });

    test('isPassportValid returns true for valid passport serial', () {
      const serial = 'AB1234567';
      final result = PassportDataUtil.isPassportValid(serial);
      expect(result, isTrue);
    });

    test('isPassportValid returns false for invalid passport serial', () {
      const serial = '12345678';
      final result = PassportDataUtil.isPassportValid(serial);
      expect(result, isFalse);
    });

    test('isPassportValid returns false for invalid passport number', () {
      const serial = 'AB1234567B';
      final result = PassportDataUtil.isPassportValid(serial);
      expect(result, isFalse);
    });
  });
}
