import 'package:weather_animation/weather_animation.dart';

WeatherScene getWeatherSceneGerman(String weatherDescription) {
  if (weatherDescription.toLowerCase().contains('bedeckt') ||
      weatherDescription.toLowerCase().contains('bewölkt') ||
      weatherDescription.toLowerCase().contains('wolken')) {
    return WeatherScene.sunset;
  } else if (weatherDescription.toLowerCase().contains('regen')) {
    return WeatherScene.rainyOvercast;
  } else if (weatherDescription.toLowerCase().contains('schnee') ||
      weatherDescription.toLowerCase().contains('schnee') &&
          weatherDescription.toLowerCase().contains('bedeckt') ||
      weatherDescription.toLowerCase().contains('wolken') ||
      weatherDescription.toLowerCase().contains('bewölkt')) {
    return WeatherScene.snowfall;
  } else if (weatherDescription.toLowerCase().contains('sturm') ||
      weatherDescription.toLowerCase().contains('sturm') &&
          weatherDescription.toLowerCase().contains('bedeckt') ||
      weatherDescription.toLowerCase().contains('wolken') ||
      weatherDescription.toLowerCase().contains('bewölkt')) {
    return WeatherScene.stormy;
  } else if (weatherDescription.toLowerCase().contains('frost') ||
      weatherDescription.toLowerCase().contains('frost') &&
          weatherDescription.toLowerCase().contains('bedeckt') ||
      weatherDescription.toLowerCase().contains('wolken') ||
      weatherDescription.toLowerCase().contains('bewölkt')) {
    return WeatherScene.frosty;
  } else if (weatherDescription.toLowerCase().contains('schnee') &&
      weatherDescription.toLowerCase().contains('regen')) {
    return WeatherScene.showerSleet;
  } else if (weatherDescription.toLowerCase().contains('bedeckt') ||
      weatherDescription.toLowerCase().contains('wolken') ||
      weatherDescription.toLowerCase().contains('bewölkt') &&
          weatherDescription.toLowerCase().contains('schnee') &&
          weatherDescription.toLowerCase().contains('regen')) {
    return WeatherScene.weatherEvery;
  } else {
    return WeatherScene.scorchingSun;
  }
}
