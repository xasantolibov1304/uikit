/// Default font shipped with the uikit package.
///
/// Consuming apps can use their own font by declaring it in their
/// `pubspec.yaml` and passing `fontFamily: 'MyFont', fontPackage: null`
/// to the typography builders / `createThemeData`.
abstract final class UikitFont {
  /// Font family name as declared in uikit's `pubspec.yaml`.
  static const String family = 'AeonikPro';

  /// Package that bundles [family]. `null` means the font is declared
  /// by the app itself.
  static const String package = 'uikit';

  /// Full family name usable where no `package` parameter exists
  /// (e.g. `ThemeData.fontFamily`).
  static String resolve(String family, String? package) =>
      package == null ? family : 'packages/$package/$family';
}
