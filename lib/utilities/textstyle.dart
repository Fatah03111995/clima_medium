import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get valDefault => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get valWeather =>
      valDefault.copyWith(color: Colors.grey.shade700);
}
