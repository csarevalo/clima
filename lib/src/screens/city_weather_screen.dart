import 'package:clima/src/utils/constants.dart';
import 'package:flutter/material.dart';

class CityWeatherScreen extends StatelessWidget {
  const CityWeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: backgroundImageAsset,
        ),
      ),
      child: Text('City Weather'),
    );
  }
}
