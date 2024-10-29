import 'package:clima/src/clima_app.dart';
import 'package:clima/src/providers/weather_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  final WeatherProvider weatherProvider = WeatherProvider();
  // await weatherProvider.init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => weatherProvider,
      child: const ClimaApp(),
    ),
  );
}
