import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    LocationPermission getPermission = await Geolocator.requestPermission();
    print(getPermission);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('WORKING')),
    );
  }
}
