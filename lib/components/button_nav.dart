import 'package:clima_medium/utilities/buttonstyle.dart';
import 'package:flutter/material.dart';

class ButtonNav extends StatelessWidget {
  final IconData icon;
  final void Function() onPress;
  final double size = 20;
  const ButtonNav(
      {super.key, required this.icon, required this.onPress, double? size});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyles.buttonNav,
      onPressed: () {
        onPress();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
