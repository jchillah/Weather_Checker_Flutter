# weather_checker

A Flutter weather application that fetches real-time weather data and forecasts using an API.

## Features
- Fetches current weather data for a given city
- Retrieves a multi-day weather forecast
- Uses `provider` for state management
- Displays weather animations and icons
- Custom styling with `google_fonts` and `flex_color_scheme`
- `.env` file support for API key security

## Setup Instructions

### Prerequisites
Ensure you have Flutter installed. You can check by running:
```sh
flutter --version
```

### Clone the Repository
```sh
git clone https://github.com/YOUR_USERNAME/ts_5_6_2_api.git
cd ts_5_6_2_api
```

### Install Dependencies
```sh
flutter pub get
```

### Configure API Key
Create a `.env` file in the root directory and add your API key:
```sh
touch .env
```
Inside `.env`, add the following:
```env
API_KEY=your_api_key_here
```

### Run the App
```sh
flutter run
```

## Dependencies
This project uses the following Flutter packages:

| Package            | Version  |
|--------------------|----------|
| flutter           | latest   |
| cupertino_icons   | ^1.0.6   |
| http              | ^1.2.1   |
| webview_flutter   | ^4.8.0   |
| flex_color_scheme | ^7.3.1   |
| google_fonts      | ^6.2.1   |
| provider          | ^6.1.2   |
| flutter_dotenv    | ^5.1.0   |
| intl              | ^0.19.0  |
| weather_icons     | ^3.0.0   |
| weather_animation | ^1.0.1   |

## License
This project is licensed under the MIT License.

## Contributing
Feel free to fork the repository and submit a pull request with improvements!

---
Happy coding! 🚀

