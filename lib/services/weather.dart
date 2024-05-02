import 'package:clima_medium/services/location.dart';
import 'package:clima_medium/services/networking.dart';
import 'package:clima_medium/utilities/textstyle.dart';
import 'package:clima_medium/utilities/util.dart';
import 'package:flutter/material.dart';

class WeatherData {
  final double temp;
  final int humidity;
  final double pressure;
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
        pressure: decodeData['main']['pressure'] * 0.000987,
        weather: decodeData['weather'][0]['main'].toLowerCase(),
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

  static String getWeatherBc(String weather) {
    switch (weather) {
      case 'clouds':
        return 'images/cloudy.jpg';
      case 'rain' || 'thunderstorm' || 'drizzle':
        return 'images/rainy.jpg';
      case 'sunny' || 'clear' || 'atmosphere':
        return 'images/sunny.jpg';
      default:
        return 'images/default.jpg';
    }
  }

  static IconData getWeatherIcon(String weather) {
    switch (weather) {
      case 'clouds':
        return Icons.cloud;
      case 'rain' || 'thunderstorm' || 'drizzle':
        return Icons.thunderstorm_rounded;
      case 'sunny' || 'clear' || 'atmosphere':
        return Icons.sunny;
      default:
        return Icons.thermostat;
    }
  }

  static TextStyle getWeatherTxtStl(String weather) {
    switch (weather) {
      case 'clouds':
        return TextStyles.valCloud;
      case 'rain' || 'thunderstorm' || 'drizzle':
        return TextStyles.valRain;
      case 'sunny' || 'clear' || 'atmosphere':
        return TextStyles.valSunny;
      default:
        return TextStyles.valDefault;
    }
  }
}
