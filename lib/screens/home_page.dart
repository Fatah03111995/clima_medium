import 'package:clima_medium/services/weather.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  WeatherData data = WeatherData.initial;
  @override
  void initState() {
    super.initState();
    getDataLocation();
  }

  void getDataLocation() async {
    WeatherData datas = await WeatherData.data;
    setState(() {
      data = datas;
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
          Text(
            'temp : ${data.temp} C humidity : ${data.humidity} %',
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
