import 'package:clima_medium/services/location.dart';
import 'package:clima_medium/services/networking.dart';
import 'package:clima_medium/utilities/util.dart';

class WeatherData {
  final double temp;
  final int humidity;
  final int pressure;
  final String weather;
  final String weatherDesc;
  final String location;
  final int seaLevel;
  WeatherData(
      {required this.humidity,
      required this.location,
      required this.temp,
      required this.pressure,
      required this.weather,
      required this.weatherDesc,
      required this.seaLevel});

  static Future get data async {
    Location position = await Location.getCurrentData();
    Network networking = Network(
        apiWeatherCall(lat: position.latitude, lon: position.longitude));
    Map decodeData = await networking.getRequest();
    return WeatherData(
        humidity: decodeData['main']['humidity'],
        location: decodeData['name'],
        temp: decodeData['main']['temp'],
        pressure: decodeData['main']['pressure'],
        weather: decodeData['weather'][0]['main'],
        weatherDesc: decodeData['weather'][0]['description'],
        seaLevel: decodeData['main']['sea_level']);
  }

  static get initial {
    return WeatherData(
        humidity: 0,
        location: 'loading',
        temp: 0,
        pressure: 0,
        weather: 'loading',
        weatherDesc: 'loading',
        seaLevel: 0);
  }
}
