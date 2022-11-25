import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/data/local/shared_preferences_repository.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/data/models/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherController extends ChangeNotifier {
  WeatherController(this._weather);

  Data _weather;
  get weather => _weather;

  Future<void> getWeather(City city) async {
    final weather = await getWeatherFromBackend(city);
    SharePreferencesRepository prefs =
        SharePreferencesRepository(await SharedPreferences.getInstance());
    prefs.saveCity(city);
    _weather = weather;
    notifyListeners();
  }

  bool isDay() {
    return _weather.dt > _weather.sys.sunrise &&
        _weather.dt < _weather.sys.sunset;
  }
}
