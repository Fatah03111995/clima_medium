import 'package:clima_medium/components/box.dart';
import 'package:clima_medium/components/box_icon.dart';
import 'package:clima_medium/components/button_nav.dart';
import 'package:clima_medium/services/weather.dart';
import 'package:clima_medium/utilities/buttonstyle.dart';
import 'package:clima_medium/utilities/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  final WeatherData? dataWithPosition;
  const HomePage({super.key, this.dataWithPosition});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // WeatherData fakeData = WeatherData(
  //     humidity: 30,
  //     location: 'disini',
  //     temp: 70,
  //     pressure: 700,
  //     weather: 'clear',
  //     weatherDesc: 'weatherDesc',
  //     seaLevel: 7000);
  WeatherData? data;
  @override
  void initState() {
    super.initState();
    // data = fakeData;
    getDataLocation();
  }

  void getDataLocation() async {
    if (widget.dataWithPosition != null) {
      setState(() {
        data = widget.dataWithPosition;
      });
      return;
    }
    WeatherData datas = await WeatherData.data;
    setState(() {
      data = datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitThreeBounce(
                color: Colors.amber,
                size: 30,
              ),
              Text('Mohon Menunggu, Sedang Mengambil Data...'),
            ]),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/homePageBc.jpg',
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          ),
          child: SafeArea(
            child: Stack(
              children: [
// ------------------ TOP NAVIGATOR

                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonNav(
                        icon: Icons.location_on_outlined,
                        onPress: () => setState(() {
                          data = null;
                          getDataLocation();
                        }),
                      ),
                      ButtonNav(
                        icon: Icons.search,
                        onPress: () => setState(() {}),
                      ),
                    ],
                  ),
                ),

// ---------------------- WEATHER DATA SECTION

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Box(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                                WeatherData.getWeatherIconMain(data!.weather)),
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data!.location,
                            style: TextStyles.valWeather,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

// ------------------ WHEATER and PRESSURE

                    Row(children: [
                      BoxIcon(
                        icon: WeatherData.getWeatherIcon(data!.weather),
                        txt: Text(
                          data!.weather,
                          style: TextStyles.valWeather,
                        ),
                      ),
                      BoxIcon(
                        icon: Icons.atm,
                        txt: Text(
                          '${data!.pressure.toStringAsFixed(1)} atm',
                          style: TextStyles.valWeather,
                        ),
                      ),
                    ]),

// ------------------ TEMP and HUMIDITY

                    Row(children: [
                      BoxIcon(
                        icon: Icons.thermostat_rounded,
                        txt: Text(
                          '${data!.temp}°C',
                          style: TextStyles.valWeather,
                        ),
                      ),
                      BoxIcon(
                        icon: Icons.water_drop_outlined,
                        txt: Text(
                          '${data!.humidity} %',
                          style: TextStyles.valWeather,
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
