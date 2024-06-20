import 'package:flutter/foundation.dart';
import 'package:ts_5_6_2_api/src/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  Future<Map<String, dynamic>>? weatherData;
  Future<List<dynamic>>? forecastData;

  Future<void> getWeatherData(String city) async {
    weatherData = _weatherService.getWeather(city);
    forecastData = _weatherService.getForecast(city);
    notifyListeners();
  }
}
