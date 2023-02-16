import 'dart:developer';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/data/constants.dart';
import 'package:weather_app/src/data/local/city_repository.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'dart:convert';

class SharePreferencesRepository implements CityRepository {
  final SharedPreferences prefs;

  SharePreferencesRepository(this.prefs);

  @override
  Future<City> getCity() async {
    final cityJson = prefs.getString(kCity);
    if (cityJson != null) {
      return City.fromJson(jsonDecode(cityJson));
    }
    return City("Ha Noi", 21, 105.8);
  }

  @override
  Future<void> saveCity(City city) async {
    final json = jsonEncode(city.toJson());

    prefs.setString(kCity, json);
  }
}
