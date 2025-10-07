import 'package:flutter/material.dart';

class Assets {
  static const aFontProduct = 'Product';
  static const aFontNeoSans = 'NeoSans';

  static Color getSafeMaterialColor(int index) {
    return materialColor[index % materialColor.length];
  }

  static List<Color> get materialColor => [
        Colors.red,
        Colors.purple,
        Colors.indigo,
        Colors.blue,
        Colors.teal,
        Colors.green,
        Colors.orange,
        Colors.brown,
        Colors.grey,
        Colors.pink,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.cyan,
        Colors.lightGreen,
        Colors.deepOrange,
        Colors.blueGrey,
      ];
}
