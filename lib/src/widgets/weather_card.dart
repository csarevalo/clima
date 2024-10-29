import 'package:clima/src/widgets/temp_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    this.openWeatherIconString = '',
    required this.temperature,
  });
  final String openWeatherIconString;
  final double temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidSun,
                size: 70,
              ),
              Image.network(
                'http://openweathermap.org/img/wn/$openWeatherIconString@2x.png',
              )
            ],
          ),
          TempCard(temperature: temperature),
        ],
      ),
    );
  }
}
