// File: lib/src/features/main_screen/presentation/widgets/weather_display.dart
import 'package:flutter/material.dart';
import 'package:ts_5_6_2_api/config/app_color.dart';
import 'package:ts_5_6_2_api/src/utils/weather_scene_german.dart';
import 'package:ts_5_6_2_api/src/utils/weather_utils.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherDisplay extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherDisplay({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String iconCode = weatherData['weather'][0]['icon'] ?? '';
    final String weatherDescription =
        weatherData['weather'][0]['description'] ?? '';
    final WeatherScene currentWeatherScene =
        getWeatherSceneGerman(weatherDescription);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(0, 0, 0, 0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          WeatherSceneWidget(
            weatherScene: currentWeatherScene,
          ),
          Positioned(
            top: 250,
            left: 50,
            child: Row(
              children: [
                Image.network(
                  getWeatherIconUrl(iconCode),
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  'City: ${weatherData['name']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 290,
            left: 70,
            child: Column(
              children: [
                Text(
                  'Temperature: ${weatherData['main']['temp']}°C',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Weather: $weatherDescription',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Humidity: ${weatherData['main']['humidity']}%',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Wind Speed: ${weatherData['wind']['speed']} m/s',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Wind Degree: ${weatherData['wind']['deg']} degrees',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Pressure: ${weatherData['main']['pressure']} hPa',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Sunrise: ${convertTimestampToTime(weatherData['sys']['sunrise'])}',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
                Text(
                  'Sunset: ${convertTimestampToTime(weatherData['sys']['sunset'])}',
                  style: const TextStyle(
                    color: AppColors.textcolor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
