import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get valDefault => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      );

  static TextStyle get large => valDefault.copyWith(fontSize: 30);
  static TextStyle get largeBold => large.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get medium => valDefault.copyWith(fontSize: 18);
  static TextStyle get mediumBold =>
      medium.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get small => valDefault.copyWith(fontSize: 10);
  static TextStyle get smallBold => small.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get valWeather => valDefault.copyWith(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get button => medium;

  static TextStyle get formLabel => mediumBold.copyWith(color: Colors.blue);
  static TextStyle get formError => small.copyWith(color: Colors.red);
  static TextStyle get formValue => medium.copyWith(color: Colors.blue);
  static TextStyle get formHint => medium.copyWith(color: Colors.grey.shade400);
}
