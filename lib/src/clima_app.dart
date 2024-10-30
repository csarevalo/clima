import 'package:clima/src/providers/weather_provider.dart';
import 'package:clima/src/screens/home_screen.dart';
import 'package:clima/src/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const backgroundImageAsset = AssetImage('assets/imgs/palm_trees_beach.jpg');

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherProvider weatherProvider = WeatherProvider();
    return ChangeNotifierProvider(
      create: (BuildContext context) => weatherProvider,
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: FutureBuilder(
          future: Future.wait([
            weatherProvider.init(),
            precacheImage(backgroundImageAsset, context)
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: backgroundImageAsset,
                  ),
                ),
                child: HomeScreen(),
              );
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
