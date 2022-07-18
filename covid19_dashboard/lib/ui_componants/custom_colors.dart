import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomColors {
  static final lightBlue=Color.fromARGB(255, 22, 130,173);
  static final grayBlue=  Color.fromARGB(255, 70, 79,110);
  static final lightGrayBlue=  Color.fromARGB(255, 124, 107, 196);
  static final softGrayBlue=  Color.fromARGB(255, 153, 159, 191);
  static final deepBlue=  Color.fromARGB(255, 28 , 34,54);
  static final skyBlue=  Color.fromARGB(255, 71 , 136,221);
  static final gBlue=  Color.fromARGB(255, 67 , 65,182);
  static final green=  Color.fromARGB(255, 2 , 194,67);
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}