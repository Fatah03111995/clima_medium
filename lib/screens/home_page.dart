import 'package:clima_medium/components/box.dart';
import 'package:clima_medium/services/weather.dart';
import 'package:clima_medium/utilities/textstyle.dart';
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

  TextStyle getTextStyle() {
    return WeatherData.getWeatherTxtStl(data.weather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  WeatherData.getWeatherBc(data.weather),
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(0, 0, 0, 0.2)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    data = WeatherData.initial;
                    getDataLocation();
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'refresh',
                      style: TextStyles.valDefault,
                    )
                  ],
                ),
              ),
              const Text(
                'The Weather today',
                textAlign: TextAlign.center,
              ),
              Row(children: [
                Box(
                  icon: WeatherData.getWeatherIcon(data.weather),
                  txt: Text(
                    data.weather,
                    style: getTextStyle(),
                  ),
                ),
                Box(
                  icon: Icons.atm,
                  txt: Text(
                    '${data.pressure.toStringAsFixed(3)} atm',
                    style: getTextStyle(),
                  ),
                ),
              ]),
              Row(children: [
                Box(
                  icon: Icons.thermostat_rounded,
                  txt: Text(
                    '${data.temp}°C',
                    style: getTextStyle(),
                  ),
                ),
                Box(
                  icon: Icons.dew_point,
                  txt: Text(
                    '${data.humidity} %',
                    style: getTextStyle(),
                  ),
                ),
              ]),
            ],
          )),
    );
  }
}
