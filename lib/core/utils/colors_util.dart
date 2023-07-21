import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:bloc_skeleton/common_ui/common_colors.dart';
import 'package:flutter/material.dart';

class ColorsUtil {
  static Color getRandomColorFromString(String str) {
    var hashCode = utf8.encode(str);
    var colorCode = hashCode.fold<int>(0, (prev, code) => prev * 31 + code);
    return Color(colorCode).withOpacity(1.0);
  }

  static String colorToHex(Color color) {
    String hexString = '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}';
    return hexString;
  }

  static Color getRandomColorFromStringWithPallete(String str) {
    var hashCode = utf8.encode(str);
    var colorIndex = hashCode.fold<int>(0, (prev, code) => prev * 31 + code) % predefinedColors.length;
    return predefinedColors[colorIndex];
  }

  static List<Color> predefinedColors = [
    CommonColors.purple1,
    CommonColors.purple2,
    CommonColors.purple3,
    CommonColors.purple4,
  ];


  static Color getRandomColor() {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }
}