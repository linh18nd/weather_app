import 'package:flutter/material.dart';
import 'package:weather_app/src/app.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/controller.dart/provider/weather_controller.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/data/models/weather.dart';

void main() async {
  Data data = await getWeatherFromBackend(City("Ha Noi", 21, 105.8));
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherController(data),
    child: const MyApp(),
  ));
}
