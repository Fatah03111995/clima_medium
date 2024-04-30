import 'package:clima_medium/utilities/constants.dart' as constants;

Uri apiWeatherCall({double? lat = 0, double? lon = 0}) {
  print('latitude : $lat, longitude : $lon');
  String url =
      'https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=${constants.apiKey}';
  return Uri.parse(url);
}
