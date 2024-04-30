import 'package:clima_medium/services/location.dart';
import 'package:clima_medium/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();

    getDataLocation();
  }

  void getDataLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    http.Response data = await http
        .get(apiWeatherCall(lat: location.latitude, lon: location.longitude));
    print(data.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('WORKING'),
          FloatingActionButton(onPressed: () {}),
        ],
      )),
    );
  }
}
