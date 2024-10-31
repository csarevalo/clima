import 'package:clima/src/services/location.dart';
import 'package:clima/src/services/networking.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

// '/3.0/onecall' or '/2.5/weather'
const String _openWeatherUrl =
    'https://api.openweathermap.org/data/2.5/weather';
const String _apiKey = 'f6a2b2f36fe1df4ac64e75e29ad0f49e';

class WeatherProvider extends ChangeNotifier {
  final Location _location = Location();

  late WeatherData _weatherData;

  WeatherData get weatherData => _weatherData;

  final String _units = 'imperial'; // Fahrenheit // 'metric'; // Celsius

  /// Must initialize provider to get weather data
  Future<void> init() async {
    await getLocationWeather();
  }

  /// Use to refresh weather
  Future<void> refreshData() async {
    await getLocationWeather();
  }

  /// Get weather data from the user's location.
  /// App must be granted access to location services to function.
  Future<void> getLocationWeather() async {
    Position? position = await _location.getPosition();

    if (position == null) {
      _weatherData = weatherDataError(
        'Unable to access location services.',
      );
    } else {
      double lat = position.latitude;
      double long = position.longitude;
      // debugPrint('lat: $lat, long: $long');

      NetworkHelper networkHelper = NetworkHelper(
        // '$_openWeatherUrl?lat=$lat&lon=$long&units=$_units&exclude=hourly,daily&appid=$_apiKey',
        '$_openWeatherUrl?lat=$lat&lon=$long&units=$_units&APPID=$_apiKey',
      );

      var openWeatherData = await networkHelper.getWeatherData();

      if (openWeatherData == null) {
        _weatherData = weatherDataError(
          'Unable to access Open Weather services, or invalid city name.',
        );
      } else {
        _weatherData = WeatherData(
          city: openWeatherData['name'],
          description: openWeatherData['weather'][0]['description'],
          temperature: openWeatherData?['main']['temp'],
          openWeatherIcon: openWeatherData?['weather'][0]['icon'],
        );
      }
    }
    notifyListeners();
  }

  Future<void> getCityWeather({
    required String city,
    String countryCode = '',
  }) async {
    // String url = '$_openWeatherUrl?q=$city,$countryCode&units=$_units&APPID=$_apiKey';
    // debugPrint(url);
    String country = countryCode.isEmpty ? '' : ',$countryCode';
    NetworkHelper networkHelper = NetworkHelper(
      // 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=f6a2b2f36fe1df4ac64e75e29ad0f49e'
      '$_openWeatherUrl?q=$city$country&units=$_units&APPID=$_apiKey',
    );

    var openWeatherData = await networkHelper.getWeatherData();

    if (openWeatherData == null) {
      _weatherData = weatherDataError(
        'Verify you entered city name correctly.',
      );
    } else {
      _weatherData = WeatherData(
        city: openWeatherData['name'],
        description: openWeatherData['weather'][0]['description'],
        temperature: openWeatherData?['main']['temp'],
        openWeatherIcon: openWeatherData?['weather'][0]['icon'],
      );
    }
    notifyListeners();
  }

  /// Used to deliver error messages in the form of [WeatherData].
  WeatherData weatherDataError(String errorMsg) {
    return WeatherData(
      error: true,
      city: '',
      description: errorMsg,
      temperature: 0,
      openWeatherIcon: '11d', //stormy cloud
    );
  }
}

/// Contains only app essential weather data
class WeatherData {
  WeatherData({
    required this.city,
    required this.description,
    required this.temperature,
    required this.openWeatherIcon,
    this.error = false,
  });

  final String city;
  final String description;
  final double temperature;
  final String openWeatherIcon;
  final bool error;
}
