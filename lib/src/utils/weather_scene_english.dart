import 'package:weather_animation/weather_animation.dart';

// ignore: unused_element
WeatherScene _getWeatherSceneEnglish(String weatherDescription) {
  if (weatherDescription.toLowerCase().contains('clouds')) {
    return WeatherScene.sunset;
  } else if (weatherDescription.toLowerCase().contains('rain')) {
    return WeatherScene.rainyOvercast;
  } else if (weatherDescription.toLowerCase().contains('snow') ||
      weatherDescription.toLowerCase().contains('snow') &&
          weatherDescription.toLowerCase().contains('clouds')) {
    return WeatherScene.snowfall;
  } else if (weatherDescription.toLowerCase().contains('stormy') ||
      weatherDescription.toLowerCase().contains('stormy') &&
          weatherDescription.toLowerCase().contains('clouds')) {
    return WeatherScene.stormy;
  } else if (weatherDescription.toLowerCase().contains('frost') ||
      weatherDescription.toLowerCase().contains('frost') &&
          weatherDescription.toLowerCase().contains('clouds')) {
    return WeatherScene.frosty;
  } else if (weatherDescription.toLowerCase().contains('snow') &&
      weatherDescription.toLowerCase().contains('rain')) {
    return WeatherScene.showerSleet;
  } else if (weatherDescription.toLowerCase().contains('clouds') &&
      weatherDescription.toLowerCase().contains('snow') &&
      weatherDescription.toLowerCase().contains('rain')) {
    return WeatherScene.weatherEvery;
  } else {
    return WeatherScene.scorchingSun;
  }
}
