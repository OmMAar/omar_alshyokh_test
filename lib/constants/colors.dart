import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor = Color(0xff174674);
  static const secondaryColor = Color(0xff4285F4);
  static const lightSecondaryColor = Color(0xff0858A7);

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;

  static const Color mainColor = Color(0xff174674);
  static const Color blueBackground = Color(0xff4285F4);
  static const Color linkedinButBackground = Color(0xff0858A7);
  static const Color linkedinButBorder = Color(0xff0A66C2);
  static const Color mainRed = Color(0xffF13C19);
  static const Color mainGray = Color(0xff707070);
  static const Color lightGrey = Color(0xffE3E3E3);
  static const Color chartGray = Color(0xff979797);
  static const Color mainOrange = Color(0xffEBAC2D);
  static const Color darkOrange = Color(0xffFDA12C);
  static const Color mainYellow = Color(0xffFDC71F);
  static const Color mainGreen = Color(0xff00CE30);
  static const Color darkGreen = Color(0xff009744);
  static const Color secondaryGreen = Color(0xff39A95E);
  static const Color indicatorBGColor = Color(0xffE1E5EB);

  static const Color scaffoldBGColor = Color(0xffF6F7FA);
  static const Color appBarBGColor = Color(0xffF6F7FA);
  static const Color firstBac = Color(0xff457AF7);
  static const Color midBac = Color(0xff2B58D4);
  static const Color secondBac = Color(0xff0627A2);
  static const Color mainEndBG = Color(0xff000a7c);
  static const Color mainStartBG = Color(0xff000bbf);
  static const Color cardBG = Color(0xff495896);
  static const Color dividerColor = Color(0xff0A2175);
  static const Color reportButton = Color(0xff081C71);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
