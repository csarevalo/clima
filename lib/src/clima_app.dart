import 'package:clima/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

const backgroundImage = AssetImage('assets/imgs/palm_trees_beach.jpg');

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: backgroundImage,
          ),
        ),
        child: HomeScreen(),
      ),
    );
  }
}
