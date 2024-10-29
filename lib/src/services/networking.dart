import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(
    this.url,
  );
  final String url;
  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      debugPrint(response.statusCode.toString());
    }
    return null;
  }
}

// Future<void> getWeatherData() async {
//   await getPosition();
//   double lat = position?.latitude ?? 0;
//   double long = position?.longitude ?? 0;
//   debugPrint('lat: $lat, long: $long');

//   const String openWeatherUrl = 'https://api.openweathermap.org/data';
//   const String apiKey = 'f6a2b2f36fe1df4ac64e75e29ad0f49e';

//   http.Response response = await http.get(Uri.parse(
//     // '$openWeatherUrl/3.0/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=$apiKey',
//     '$openWeatherUrl/2.5/weather?lat=$lat&lon=$long&APPID=$apiKey',
//   ));
//   debugPrint('Response status: ${response.statusCode}');
//   if (response.statusCode == 200) {
//     debugPrint('Response body: ${response.body}');
//     weatherData = jsonDecode(response.body);
//   }

//   return;
// }
