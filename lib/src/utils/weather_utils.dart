import 'package:intl/intl.dart';

String convertTimestampToTime(int timestamp) {
  final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('HH:mm').format(dateTime);
}

String convertTimestampToDate(int timestamp) {
  final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('E, MMM d').format(dateTime);
}

String getWeatherIconUrl(String iconCode) {
  return 'http://openweathermap.org/img/wn/$iconCode.png';
}
