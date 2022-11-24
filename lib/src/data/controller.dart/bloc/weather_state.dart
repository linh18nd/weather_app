import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/data/models/weather.dart';

class WeatherState {
  final City city;
  final Data data;
  WeatherState(this.city, this.data);
}
