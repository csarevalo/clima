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
