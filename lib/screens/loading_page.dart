import 'dart:convert';

import 'package:clima_medium/services/location.dart';
import 'package:clima_medium/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  late double? latitude = 0;
  late double? longitude = 0;
  late String weather = 'loading';
  late String location = 'loading';
  @override
  void initState() {
    super.initState();
    getDataLocation();
  }

  void getDataLocation() async {
    Location position = await Location.getCurrentData();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    http.Response data =
        await http.get(apiWeatherCall(lat: latitude, lon: longitude));
    setState(() {
      location = jsonDecode(data.body)['name'];
      weather = jsonDecode(data.body)['weather'][0]['main'];
    });
    print(data.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The Weather today',
            textAlign: TextAlign.center,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                getDataLocation();
              });
            },
            child: const Text('refresh'),
          ),
          Text(
            'lat : $latitude, lon : $longitude',
            textAlign: TextAlign.center,
          ),
          Text(
            'lokasi : $location cuaca : $weather',
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
