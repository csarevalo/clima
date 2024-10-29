import 'package:clima/src/providers/weather_provider.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Clima'),
        centerTitle: true,
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
