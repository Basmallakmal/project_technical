/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $GoogleFontsGen {
  const $GoogleFontsGen();

  /// File path: google_fonts/OFL.txt
  String get ofl => 'google_fonts/OFL.txt';

  /// File path: google_fonts/Poppins-Black.ttf
  String get poppinsBlack => 'google_fonts/Poppins-Black.ttf';

  /// File path: google_fonts/Poppins-BlackItalic.ttf
  String get poppinsBlackItalic => 'google_fonts/Poppins-BlackItalic.ttf';

  /// File path: google_fonts/Poppins-Bold.ttf
  String get poppinsBold => 'google_fonts/Poppins-Bold.ttf';

  /// File path: google_fonts/Poppins-BoldItalic.ttf
  String get poppinsBoldItalic => 'google_fonts/Poppins-BoldItalic.ttf';

  /// File path: google_fonts/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'google_fonts/Poppins-ExtraBold.ttf';

  /// File path: google_fonts/Poppins-ExtraBoldItalic.ttf
  String get poppinsExtraBoldItalic =>
      'google_fonts/Poppins-ExtraBoldItalic.ttf';

  /// File path: google_fonts/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'google_fonts/Poppins-ExtraLight.ttf';

  /// File path: google_fonts/Poppins-ExtraLightItalic.ttf
  String get poppinsExtraLightItalic =>
      'google_fonts/Poppins-ExtraLightItalic.ttf';

  /// File path: google_fonts/Poppins-Italic.ttf
  String get poppinsItalic => 'google_fonts/Poppins-Italic.ttf';

  /// File path: google_fonts/Poppins-Light.ttf
  String get poppinsLight => 'google_fonts/Poppins-Light.ttf';

  /// File path: google_fonts/Poppins-LightItalic.ttf
  String get poppinsLightItalic => 'google_fonts/Poppins-LightItalic.ttf';

  /// File path: google_fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'google_fonts/Poppins-Medium.ttf';

  /// File path: google_fonts/Poppins-MediumItalic.ttf
  String get poppinsMediumItalic => 'google_fonts/Poppins-MediumItalic.ttf';

  /// File path: google_fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'google_fonts/Poppins-Regular.ttf';

  /// File path: google_fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'google_fonts/Poppins-SemiBold.ttf';

  /// File path: google_fonts/Poppins-SemiBoldItalic.ttf
  String get poppinsSemiBoldItalic => 'google_fonts/Poppins-SemiBoldItalic.ttf';

  /// File path: google_fonts/Poppins-Thin.ttf
  String get poppinsThin => 'google_fonts/Poppins-Thin.ttf';

  /// File path: google_fonts/Poppins-ThinItalic.ttf
  String get poppinsThinItalic => 'google_fonts/Poppins-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
    ofl,
    poppinsBlack,
    poppinsBlackItalic,
    poppinsBold,
    poppinsBoldItalic,
    poppinsExtraBold,
    poppinsExtraBoldItalic,
    poppinsExtraLight,
    poppinsExtraLightItalic,
    poppinsItalic,
    poppinsLight,
    poppinsLightItalic,
    poppinsMedium,
    poppinsMediumItalic,
    poppinsRegular,
    poppinsSemiBold,
    poppinsSemiBoldItalic,
    poppinsThin,
    poppinsThinItalic,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/placeholder.json
  String get placeholder => 'assets/icons/placeholder.json';

  /// List of all assets
  List<String> get values => [placeholder];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/english_flag.png
  AssetGenImage get englishFlag =>
      const AssetGenImage('assets/images/english_flag.png');

  /// File path: assets/images/indonesian_flag.png
  AssetGenImage get indonesianFlag =>
      const AssetGenImage('assets/images/indonesian_flag.png');

  /// List of all assets
  List<AssetGenImage> get values => [englishFlag, indonesianFlag];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $GoogleFontsGen googleFonts = $GoogleFontsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
