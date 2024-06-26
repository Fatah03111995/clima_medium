import 'package:flutter/material.dart';

class BoxIcon extends StatelessWidget {
  final IconData icon;
  final Text txt;
  const BoxIcon({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(206, 206, 206, 0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              txt
            ]),
      ),
    );
  }
}
