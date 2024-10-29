import 'package:clima/src/widgets/weather_card.dart';
import 'package:clima/src/widgets/weather_message_card.dart';
import 'package:flutter/material.dart';

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
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WeatherCard(
            openWeatherIconString: '02n',
            temperature: 71,
          ),
          WeatherMessageCard(),
        ],
      ),
    );
  }
}
