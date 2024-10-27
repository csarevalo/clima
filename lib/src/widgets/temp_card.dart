import 'package:flutter/material.dart';

class TempCard extends StatelessWidget {
  const TempCard({
    super.key,
    required this.temperature,
  });

  final double temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          temperature.toStringAsFixed(0),
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Text(
          //TODO: Create user preference settings for Farenheit/Celcius
          '°F', //'℃',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ],
    );
  }
}
