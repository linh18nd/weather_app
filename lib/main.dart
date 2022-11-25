import 'package:flutter/material.dart';
import 'package:weather_app/src/app.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/controller.dart/provider/weather_controller.dart';
import 'package:weather_app/src/data/local/shared_preferences_repository.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/data/models/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharePreferencesRepository prefs =
      SharePreferencesRepository(await SharedPreferences.getInstance());
  Data data = await getWeatherFromBackend(await prefs.getCity());
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherController(data),
    child: const MyApp(),
  ));
}
