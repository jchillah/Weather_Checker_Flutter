import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_5_6_2_api/data/weather_provider.dart';
import 'package:ts_5_6_2_api/src/utils/weather_utils.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        if (weatherProvider.forecastData == null) {
          return Container();
        }
        return FutureBuilder<List<dynamic>>(
          future: weatherProvider.forecastData!,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              );
            } else if (snapshot.hasData) {
              final forecastData = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: forecastData.length,
                itemBuilder: (context, index) {
                  if (index % 8 != 0) {
                    return Container();
                  }

                  final forecast = forecastData[index];
                  final String date = convertTimestampToDate(forecast['dt']);
                  final String iconCode = forecast['weather'][0]['icon'] ?? '';
                  final String description =
                      forecast['weather'][0]['description'] ?? '';
                  final dynamic temp = forecast['main']['temp'];

                  return ListTile(
                    leading: Image.network(
                      getWeatherIconUrl(iconCode),
                      width: 50,
                      height: 50,
                    ),
                    title: Text(date),
                    subtitle: Text(description),
                    trailing: Text('${temp.toStringAsFixed(1)}°C'),
                  );
                },
              );
            } else {
              return const Text('No data available');
            }
          },
        );
      },
    );
  }
}
