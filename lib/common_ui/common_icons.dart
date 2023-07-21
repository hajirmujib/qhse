import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonIcons {
  /// for class material icon
  static SvgPicture logoHse = logoSizeAssets(
    'Madhani QHSE App Logo.svg',
  );
  static SvgPicture iconLogin = defaulIconAssets(
    'Login.svg',
  );
  static SvgPicture finger = defaultSizeAssets(
    'Fingerprint.svg',
  );

  static SvgPicture defaultSizeAssets(
    String filename, {
    Color? color,
    double width = 24,
    double height = 24,
  }) {
    return SvgPicture.asset(
      getAssetPath(filename),
      color: color,
      width: width,
      height: height,
    );
  }

  static SvgPicture defaulIconAssets(
    String filename, {
    Color? color,
    double width = 16,
    double height = 16,
  }) {
    return SvgPicture.asset(
      getAssetPath(filename),
      color: color,
      width: width,
      height: height,
    );
  }

  static SvgPicture logoSizeAssets(
    String filename, {
    Color? color,
    double width = 48,
    double height = 48,
  }) {
    return SvgPicture.asset(
      getAssetPath(filename),
      color: color,
      width: width,
      height: height,
    );
  }

  static String getAssetPath(String filename) {
    return "assets/svg/$filename";
  }
}
