import 'package:clima/src/services/location.dart';
import 'package:clima/src/services/networking.dart';
import 'package:clima/src/widgets/weather_card.dart';
import 'package:clima/src/widgets/weather_message_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({
    super.key,
  });

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final Location location = Location();
  late Position? position;
  dynamic weatherData;

  @override
  void initState() {
    super.initState();
    getPosition();
    // getWeatherData();
  }

  Future<void> getPosition() async {
    position = await location.getPosition();
  }

  Future<void> getWeatherData() async {
    await getPosition();
    double lat = position?.latitude ?? 0;
    double long = position?.longitude ?? 0;
    debugPrint('lat: $lat, long: $long');

    const String openWeatherUrl = 'https://api.openweathermap.org/data';
    const String apiKey = 'f6a2b2f36fe1df4ac64e75e29ad0f49e';

    NetworkHelper networkHelper = NetworkHelper(
      // '$openWeatherUrl/3.0/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=$apiKey',
      '$openWeatherUrl/2.5/weather?lat=$lat&lon=$long&APPID=$apiKey',
    );
    weatherData = await networkHelper.getWeatherData();

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WeatherCard(
            openWeatherIconString: weatherData?['weather'][0]['icon'] ?? '02n',
            temperature: weatherData?['main']['temp'] ?? 71,
          ),
          WeatherMessageCard(),
        ],
      ),
    );
  }
}
