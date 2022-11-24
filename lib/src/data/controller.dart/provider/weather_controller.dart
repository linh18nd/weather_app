import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/data/models/weather.dart';

class WeatherController extends ChangeNotifier {
  WeatherController(this._weather);

  Data _weather;
  get weather => _weather;

  Future<void> getWeather(City city) async {
    final weather = await getWeatherFromBackend(city);
    _weather = weather;
    notifyListeners();
  }
}
