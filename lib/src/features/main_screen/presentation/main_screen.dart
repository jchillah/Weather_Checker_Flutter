import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_5_6_2_api/data/weather_provider.dart';
import 'package:ts_5_6_2_api/src/features/main_screen/presentation/paypal_webview.dart';
import 'package:ts_5_6_2_api/src/services/weather_service.dart';
import 'package:weather_animation/weather_animation.dart';

import 'city_input.dart';
import 'forecast_data_display.dart';
import 'weather_data_display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String donateUrl =
      'https://www.paypal.com/donate/?hosted_button_id=ZJX2ASN852J6W';
  final WeatherService weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();

  Future<Map<String, dynamic>>? _weatherFuture;
  Future<List<dynamic>>? _forecastFuture;
  // ignore: unused_field
  WeatherScene? _currentWeatherScene;

  void _getWeather() {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.getWeatherData(_cityController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Checker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CityInput(
                  controller: _cityController, onFetchWeather: _getWeather),
              const SizedBox(height: 20),
              _weatherFuture == null
                  ? Container()
                  : FutureBuilder<Map<String, dynamic>>(
                      future: _weatherFuture!,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString(),
                              style: const TextStyle(color: Colors.red));
                        } else if (snapshot.hasData) {
                          return WeatherDataDisplay(
                              weatherData: snapshot.data!);
                        } else {
                          return const Text('No data available');
                        }
                      },
                    ),
              const SizedBox(height: 20),
              _forecastFuture == null
                  ? Container()
                  : FutureBuilder<List<dynamic>>(
                      future: _forecastFuture!,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString(),
                              style: const TextStyle(color: Colors.red));
                        } else if (snapshot.hasData) {
                          return ForecastDataDisplay(
                              forecastData: snapshot.data!);
                        } else {
                          return const Text('No data available');
                        }
                      },
                    ),
              const SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: 250,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PayPalWebView(url: donateUrl)),
                    );
                  },
                  child: const Text('Donate via PayPal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
