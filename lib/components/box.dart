import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Widget child;
  const Box({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(206, 206, 206, 0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: child);
  }
}
