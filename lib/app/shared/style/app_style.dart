import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFE2E2FE);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle bigTitle = GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle mainContent = GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle = GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500);
}
