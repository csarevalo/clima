import 'package:clima/src/clima_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

const backgroundImageAsset = AssetImage('assets/imgs/palm_trees_beach.jpg');
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const ClimaApp(),
  );

  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}
