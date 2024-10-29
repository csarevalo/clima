import 'package:clima/src/services/location.dart';
import 'package:clima/src/widgets/weather_card.dart';
import 'package:clima/src/widgets/weather_message_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  }

  Future<void> getPosition() async {
    position = await location.getPosition();
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
