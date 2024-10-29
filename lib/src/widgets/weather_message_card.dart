import 'package:flutter/material.dart';

class WeatherMessageCard extends StatelessWidget {
  const WeatherMessageCard({
    super.key,
    required this.city,
    required this.weatherDescription,
    this.textAlign = TextAlign.justify,
    this.error = false,
  });

  final String city;
  final String weatherDescription;
  final TextAlign textAlign;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 100.0),
      child: Text(
        // 'Perfect day for a picnic 🧺',
        error
            ? 'Error: $weatherDescription'
            : 'There is $weatherDescription in $city.',
        textAlign: textAlign,
        style: const TextStyle(
          fontSize: 42,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
