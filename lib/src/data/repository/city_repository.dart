import 'package:weather_app/src/data/models/city.dart';

abstract class CityRepository {
  Future<City> getCity();
  Future<void> saveCity(City city);
}
