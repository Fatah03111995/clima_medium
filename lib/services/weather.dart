import 'package:clima_medium/services/location.dart';
import 'package:clima_medium/services/networking.dart';
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
        apiWeatherByPosition(lat: position.latitude, lon: position.longitude));
    Map? decodeData = await networking.getRequest();
    if (decodeData == null) return null;
    return WeatherData(
        humidity: decodeData['main']['humidity'],
        location: decodeData['name'],
        temp: decodeData['main']['temp'].toDouble(),
        pressure: decodeData['main']['pressure'] * 0.000987,
        weather: decodeData['weather'][0]['main'].toLowerCase(),
        weatherDesc: decodeData['weather'][0]['description'],
        seaLevel: decodeData['main']['sea_level']);
  }

  static Future dataByCity(String cityName, String? countryCode) async {
    Network networking = Network(
        apiWeatherByLocationName(cityName: cityName, countryCode: countryCode));
    Map? decodeData = await networking.getRequest();

    if (decodeData == null) return null;
    return WeatherData(
        humidity: decodeData['main']['humidity'],
        location: decodeData['name'],
        temp: decodeData['main']['temp'].toDouble(),
        pressure: decodeData['main']['pressure'] * 0.000987,
        weather: decodeData['weather'][0]['main'].toLowerCase(),
        weatherDesc: decodeData['weather'][0]['description'],
        seaLevel: decodeData['main']['sea_level'] ?? 0);
  }

  static String getWeatherIconMain(String weather) {
    switch (weather) {
      case 'clouds':
        return 'images/clouds.png';
      case 'rain' || 'drizzle':
        return 'images/rainny.png';
      case 'thunderstorm':
        return 'images/thunderstorm.png';
      case 'sunny':
        return 'images/sunny.png';
      case 'clear':
        return 'images/sunny.png';
      case 'snow':
        return 'images/snow.png';
      default:
        return 'images/default.png';
    }
  }

  static IconData getWeatherIcon(String weather) {
    switch (weather) {
      case 'rain':
        return Icons.umbrella;
      case 'thunderstorm' || 'drizzle':
        return Icons.thunderstorm_rounded;
      case 'sunny' || 'clear' || 'atmosphere':
        return Icons.sunny;
      case 'snow':
        return Icons.ac_unit;
      default:
        return Icons.cloud;
    }
  }
}
