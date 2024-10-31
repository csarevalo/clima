import 'package:clima/src/providers/weather_provider.dart';
import 'package:clima/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityWeatherScreen extends StatefulWidget {
  const CityWeatherScreen({
    super.key,
  });

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: cityBackgroundImageAsset,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Clima Weather',
            style: TextStyle(fontSize: 36),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              CitySearchBar(controller: controller),
              const SizedBox(height: 24),
              GetWeatherButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class GetWeatherButton extends StatelessWidget {
  const GetWeatherButton({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue[900]),
        foregroundColor: WidgetStatePropertyAll(Colors.blue[100]),
      ),
      onPressed: () {
        if (controller.text.isNotEmpty) {
          weatherProvider.getCityWeather(city: controller.text);
        }
        Navigator.pop(context);
      },
      child: const Text(
        'Get Weather',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}

class CitySearchBar extends StatelessWidget {
  const CitySearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SearchBar(
        controller: controller,
        leading: Icon(
          Icons.flag_circle,
          color: Colors.grey[600],
        ),
        hintText: 'City',
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.grey[600]),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24),
        ),
      ),
    );
  }
}
