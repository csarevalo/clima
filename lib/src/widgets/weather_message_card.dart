import 'package:flutter/material.dart';

class WeatherMessageCard extends StatelessWidget {
  const WeatherMessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 100.0),
      child: Text(
        'Perfect day for a picnic 🧺',
        style: TextStyle(
          fontSize: 42,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
