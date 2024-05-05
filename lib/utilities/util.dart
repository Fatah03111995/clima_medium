import 'package:clima_medium/utilities/constants.dart' as constants;

String apiWeatherByPosition({double? lat = 0, double? lon = 0}) {
  return '${constants.apiUrl}?lat=${lat.toString()}&lon=${lon.toString()}&appid=${constants.apiKey}&units=metric';
}

String apiWeatherByLocationName(
    {required String cityName, String? countryCode = 'id'}) {
  return '${constants.apiUrl}?q=$cityName,$countryCode&appid=${constants.apiKey}&units=metric';
}
