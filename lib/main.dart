import 'package:clima/src/clima_app.dart';
// import 'package:clima/src/providers/weather_provider.dart';
// import 'package:clima/src/screens/loading_screen.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const ClimaApp(),
  );
  // whenever your initialization is completed, remove the splash screen:
  // FlutterNativeSplash.remove();
}
