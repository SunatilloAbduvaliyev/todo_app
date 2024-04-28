import 'package:flutter/material.dart';
double width = 0.0;
double height = 0.0;
extension Size on int{
  //SizedBox height
  SizedBox boxH() => SizedBox(height:(this / 812) * height);
  //SizedBox width
  SizedBox boxW() => SizedBox(width:(this / 375) * width);

  double get hSize => (this / 812) * height;

  double get wSize => (this / 375) * width;
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

