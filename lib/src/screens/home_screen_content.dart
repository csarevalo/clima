import 'package:clima/src/utils/location.dart';
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

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    position = await location.determinePosition();
    double lat = position?.latitude ?? 0;
    double long = position?.longitude ?? 0;
    debugPrint('lat: $lat, long: $long');
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WeatherCard(),
          WeatherMessageCard(),
        ],
      ),
    );
  }
}
