# weather_checker

This is a simple Weather App built with Flutter. It fetches current weather data and a forecast using an API.

## Features
- Get current weather information for any city.
- Fetch a 5-day weather forecast.
- Responsive UI with provider-based state management.

## Requirements
- Flutter SDK installed
- Dart installed
- API key from OpenWeatherMap (or another weather provider)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/weather-app.git
   cd weather-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Create a `.env` file in the root directory and add your API key:
   ```env
   API_KEY=your_api_key_here
   ```

## Usage
1. Run the app in debug mode:
   ```sh
   flutter run
   ```
2. Enter a city name to fetch weather data.

## Project Structure
```
lib/
│-- main.dart
│-- providers/
│   ├── weather_provider.dart
│-- services/
│   ├── weather_service.dart
│-- models/
│   ├── weather_model.dart
│-- views/
│   ├── home_screen.dart
```

## API Integration
The app uses `WeatherService` to fetch data from the weather API. Make sure to provide a valid API key in the `.env` file.

## Contributing
Feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.


