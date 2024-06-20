// import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// class WeatherService {
//   final String apiKey = dotenv.env['API_KEY'] ?? '';
//   final String baseUrl = 'http://api.openweathermap.org/data/2.5';

//   Future<Map<String, dynamic>> getWeather(String city) async {
//     final String getWeatherApiUrl = '$baseUrl/weather?q=$city&appid=$apiKey&units=metric';

//     final response = await http.get(Uri.parse(getWeatherApiUrl));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }

//   Future<List<dynamic>> getForecast(String city) async {
//     final String forecastApiUrl =
//         '$baseUrl/forecast?q=$city&appid=$apiKey&units=metric';

//     final response = await http.get(Uri.parse(forecastApiUrl));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body)['list'];
//     } else {
//       throw Exception('Failed to load forecast data');
//     }
//   }
// }

// Daten auf Deutsch erhalten

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl = 'http://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final String getWeatherApiUrl =
        '$baseUrl/weather?q=$city&appid=$apiKey&units=metric&lang=de';

    final response = await http.get(Uri.parse(getWeatherApiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<dynamic>> getForecast(String city) async {
    final String forecastApiUrl =
        '$baseUrl/forecast?q=$city&appid=$apiKey&units=metric&lang=de';

    final response = await http.get(Uri.parse(forecastApiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['list'];
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
