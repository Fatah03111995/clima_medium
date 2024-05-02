import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get valDefault => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );
  static TextStyle get valRain =>
      valDefault.copyWith(color: Colors.blue.shade700);
  static TextStyle get valCloud => valDefault.copyWith(color: Colors.grey[350]);
  static TextStyle get valSunny =>
      valDefault.copyWith(color: Colors.yellow.shade700);
}
