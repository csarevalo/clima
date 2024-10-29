import 'package:clima/src/services/location.dart';
import 'package:clima/src/services/networking.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

const String _openWeatherUrl = 'https://api.openweathermap.org/data';
const String _apiKey = 'f6a2b2f36fe1df4ac64e75e29ad0f49e';
WeatherData _weatherDataError = WeatherData(
  city: 'N/a',
  description: 'error: access to location denied',
  temperature: 0,
  openWeatherIcon: '02n',
);

class WeatherProvider extends ChangeNotifier {
  final Location _location = Location();

  late WeatherData weatherData;

  Future<void> init() async {
    await getWeatherData();
  }

  Future<void> refreshData() async {
    await getWeatherData();
  }

  Future<void> getWeatherData() async {
    Position? position = await _location.getPosition();

    if (position == null) {
      weatherData = _weatherDataError;
      return;
    }

    double lat = position?.latitude ?? 0;
    double long = position?.longitude ?? 0;
    debugPrint('lat: $lat, long: $long');

    NetworkHelper networkHelper = NetworkHelper(
      // '$_openWeatherUrl/3.0/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=$_apiKey',
      '$_openWeatherUrl/2.5/weather?lat=$lat&lon=$long&APPID=$_apiKey',
    );

    var openWeatherData = await networkHelper.getWeatherData();

    weatherData = WeatherData(
      city: openWeatherData['name'],
      description: openWeatherData['weather'][0]['description'],
      temperature: openWeatherData?['main']['temp'],
      openWeatherIcon: openWeatherData?['weather'][0]['icon'],
    );

    return;
  }
}

class WeatherData {
  WeatherData({
    required this.city,
    required this.description,
    required this.temperature,
    required this.openWeatherIcon,
  });

  final String city;
  final String description;
  final double temperature;
  final String openWeatherIcon;
}
