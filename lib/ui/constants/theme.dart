import 'package:flutter/material.dart';

class AppText {
  AppText._();

  static const String productSans = "ProductSans";
  static const String roboto = "Roboto";

  static const double titleSize = 24;
  static const double subTitleSize = 20;
  static const double bodySize = 16;
  static const double smallBodySize = 14;
  static const double verySmallBodySize = 11;

  static const TextStyle titleStyle = TextStyle(fontFamily: roboto, fontSize: titleSize, fontWeight: FontWeight.bold);
  static const TextStyle subTitleStyle = TextStyle(fontFamily: roboto, fontSize: subTitleSize);
  static const TextStyle bodyStyle = TextStyle(fontFamily: roboto, fontSize: bodySize);
  static const TextStyle smallBodyStyle = TextStyle(fontFamily: roboto, fontSize: smallBodySize);
  static const TextStyle verySmallBodyStyle = TextStyle(fontFamily: roboto, fontSize: verySmallBodySize, );
}

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xFFC04984);
  static const secondaryColor = Color(0xFFDFBBCD);
  static const background = Color.fromARGB(250, 47, 47, 47);
  static const backgroundDarker = Color.fromARGB(250, 32, 32, 32);
}