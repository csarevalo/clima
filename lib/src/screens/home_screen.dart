import 'package:clima/src/providers/weather_provider.dart';
import 'package:clima/src/screens/city_weather_screen.dart';
import 'package:clima/src/widgets/weather_card.dart';
import 'package:clima/src/widgets/weather_message_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => weatherProvider.refreshData(),
          icon: const Icon(Icons.my_location_rounded, size: 28),
        ),
        title: const Text(
          'Clima Weather',
          style: TextStyle(fontSize: 36),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CityWeatherScreen();
                },
              ));
            },
            icon: const Icon(
              Icons.search,
              size: 36,
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherData weatherData =
        Provider.of<WeatherProvider>(context).weatherData;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeatherCard(
            openWeatherIconString: weatherData.openWeatherIcon, //'02n',
            temperature: weatherData.temperature, //71,
          ),
          WeatherMessageCard(
            error: weatherData.error,
            city: weatherData.city,
            weatherDescription: weatherData.description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
