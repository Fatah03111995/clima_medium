const String apiKey = '6fa630d1718e0fc45a270af0066e4701';
Uri apiWeatherCall({double? lat = 0, double? lon = 0}) {
  print('latitude : $lat, longitude : $lon');
  String url =
      'https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=$apiKey';
  return Uri.parse(url);
}
