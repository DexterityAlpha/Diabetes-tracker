import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

class DiaBitTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.nunito().fontFamily,
        backgroundColor: creamcolor,
        buttonColor: Colors.blue.shade800,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.red.shade800),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: creamcolor,
          backwardsCompatibility: true,
          centerTitle: false,
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: blackShade),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.nunito().fontFamily,
        backgroundColor: HexColor("#121212"),
        accentColor: Colors.blue.shade900,
        buttonColor: Colors.blue.shade800,
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor("#121212"),
          // backwardsCompatibility: true,
          centerTitle: false,
          elevation: 0.0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );

  static Color greyishcolor1 = HexColor("#B7CAD2");
  static Color greyishcolor2 = HexColor("#DBE0E4");
  static Color bluishShade = HexColor("#6B9EB1");
  static Color brownish = HexColor("#54574B");
  static Color maroonish = HexColor("#866C77");
  static Color blackShade = HexColor("#09221D");
  static Color lightbrownish = HexColor("#AFA4A6");
  static Color bluegreyish = HexColor("#96B1CB");
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkBluishcolor = Color(0xff403b58);
}
