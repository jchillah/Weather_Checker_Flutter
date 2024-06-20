import 'package:flutter/material.dart';
import 'package:ts_5_6_2_api/src/utils/weather_utils.dart';

class ForecastDataDisplay extends StatelessWidget {
  final List<dynamic> forecastData;

  const ForecastDataDisplay({required this.forecastData, super.key});

  @override
  Widget build(BuildContext context) {
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
        final String description = forecast['weather'][0]['description'] ?? '';
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
  }
}
