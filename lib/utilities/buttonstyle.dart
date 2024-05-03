import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle get buttonNav => const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
        backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 0, 0, 0.2)),
        shape: MaterialStatePropertyAll(CircleBorder()),
      );
}
