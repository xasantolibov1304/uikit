class MyRegExps {
  const MyRegExps._();

  /// Matches only digits (e.g., "123456"), no spaces, letters, or symbols.
  static RegExp get onlyDigits => RegExp(r'^\d+$');

  /// Matches a single character that is a digit or asterisk.
  static RegExp get digitOrAsterisk => RegExp(r'[0-9*]');

  /// Matches any non-digit character.
  static RegExp get nonDigit => RegExp(r'\D');

  /// Matches a valid month string: "1" to "12", with optional leading zero.
  static RegExp get validMonth => RegExp(r'^(0?[1-9]|1[0-2])$');

  /// Matches a basic email address format like "user@domain.com".
  static RegExp get email => RegExp(r'\w+@[a-zA-Z_-]+?\.[a-zA-Z]+');

  /// Matches expiration date format: MM/YY where MM is 01–12 and YY is two digits.
  static RegExp get expirationDate => RegExp(r'^(0[1-9]|1[0-2])\/(\d{2})$');
}
