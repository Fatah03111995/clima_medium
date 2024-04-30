import 'package:clima_medium/services/weather.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  WeatherData data = WeatherData.initial;
  @override
  void initState() {
    super.initState();
    getDataLocation();
  }

  void getDataLocation() async {
    WeatherData data = await WeatherData.data;
    setState(() {
      data = data;
    });
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
                data = WeatherData.initial;
                getDataLocation();
              });
            },
            child: const Text('refresh'),
          ),
          Text(
            'lokasi : ${data.location} cuaca : ${data.weather}',
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
