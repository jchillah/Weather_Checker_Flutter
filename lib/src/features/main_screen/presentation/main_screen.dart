// File: lib/src/features/main_screen/presentation/main_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_5_6_2_api/data/weather_provider.dart';
import 'package:ts_5_6_2_api/src/features/main_screen/presentation/paypal_webview.dart';
import 'package:ts_5_6_2_api/src/features/main_screen/presentation/today_forecast.dart';
import 'package:ts_5_6_2_api/src/features/main_screen/presentation/weather_display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String donateUrl =
      'https://www.paypal.com/donate/?hosted_button_id=ZJX2ASN852J6W';
  final TextEditingController _cityController = TextEditingController();

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
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getWeather,
                child: const Text('Weather Please!'),
              ),
              const SizedBox(height: 20),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.weatherData == null) {
                    return Container();
                  }
                  return FutureBuilder<Map<String, dynamic>>(
                    future: weatherProvider.weatherData!,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          snapshot.error.toString(),
                          style: const TextStyle(color: Colors.red),
                        );
                      } else if (snapshot.hasData) {
                        return WeatherDisplay(weatherData: snapshot.data!);
                      } else {
                        return const Text('No data available');
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              const TodayForecast(),
              const SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: 250,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayPalWebView(url: donateUrl),
                      ),
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
