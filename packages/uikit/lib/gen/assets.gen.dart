/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIcons16Gen {
  const $AssetsIcons16Gen();

  /// File path: assets/icons16/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons16/filter.svg');

  /// List of all assets
  List<SvgGenImage> get values => [filter];
}

class $AssetsIcons20Gen {
  const $AssetsIcons20Gen();

  /// File path: assets/icons20/arrow_up_down.svg
  SvgGenImage get arrowUpDown =>
      const SvgGenImage('assets/icons20/arrow_up_down.svg');

  /// File path: assets/icons20/chevron_down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/icons20/chevron_down.svg');

  /// File path: assets/icons20/slider_02.svg
  SvgGenImage get slider02 => const SvgGenImage('assets/icons20/slider_02.svg');

  /// File path: assets/icons20/slider_03.svg
  SvgGenImage get slider03 => const SvgGenImage('assets/icons20/slider_03.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrowUpDown,
    chevronDown,
    slider02,
    slider03,
  ];
}

class $AssetsIcons24Gen {
  const $AssetsIcons24Gen();

  /// File path: assets/icons24/arrow_down.svg
  SvgGenImage get arrowDown =>
      const SvgGenImage('assets/icons24/arrow_down.svg');

  /// File path: assets/icons24/arrow_left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('assets/icons24/arrow_left.svg');

  /// File path: assets/icons24/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons24/calendar.svg');

  /// File path: assets/icons24/check_circle.svg
  SvgGenImage get checkCircle =>
      const SvgGenImage('assets/icons24/check_circle.svg');

  /// File path: assets/icons24/chevron_down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/icons24/chevron_down.svg');

  /// File path: assets/icons24/chevron_up.svg
  SvgGenImage get chevronUp =>
      const SvgGenImage('assets/icons24/chevron_up.svg');

  /// File path: assets/icons24/clock.svg
  SvgGenImage get clock => const SvgGenImage('assets/icons24/clock.svg');

  /// File path: assets/icons24/close_circle.svg
  SvgGenImage get closeCircle =>
      const SvgGenImage('assets/icons24/close_circle.svg');

  /// File path: assets/icons24/close_square.svg
  SvgGenImage get closeSquare =>
      const SvgGenImage('assets/icons24/close_square.svg');

  /// File path: assets/icons24/contact.svg
  SvgGenImage get contact => const SvgGenImage('assets/icons24/contact.svg');

  /// File path: assets/icons24/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/icons24/eye.svg');

  /// File path: assets/icons24/eye_slash.svg
  SvgGenImage get eyeSlash => const SvgGenImage('assets/icons24/eye_slash.svg');

  /// File path: assets/icons24/info.svg
  SvgGenImage get info => const SvgGenImage('assets/icons24/info.svg');

  /// File path: assets/icons24/info_filled.svg
  SvgGenImage get infoFilled =>
      const SvgGenImage('assets/icons24/info_filled.svg');

  /// File path: assets/icons24/reload.svg
  SvgGenImage get reload => const SvgGenImage('assets/icons24/reload.svg');

  /// File path: assets/icons24/scan.svg
  SvgGenImage get scan => const SvgGenImage('assets/icons24/scan.svg');

  /// File path: assets/icons24/warning_triangle.svg
  SvgGenImage get warningTriangle =>
      const SvgGenImage('assets/icons24/warning_triangle.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrowDown,
    arrowLeft,
    calendar,
    checkCircle,
    chevronDown,
    chevronUp,
    clock,
    closeCircle,
    closeSquare,
    contact,
    eye,
    eyeSlash,
    info,
    infoFilled,
    reload,
    scan,
    warningTriangle,
  ];
}

class UikitAssets {
  const UikitAssets._();

  static const String package = 'iman_uikit';

  static const $AssetsIcons16Gen icons16 = $AssetsIcons16Gen();
  static const $AssetsIcons20Gen icons20 = $AssetsIcons20Gen();
  static const $AssetsIcons24Gen icons24 = $AssetsIcons24Gen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'iman_uikit';

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/iman_uikit/$_assetName';
}
