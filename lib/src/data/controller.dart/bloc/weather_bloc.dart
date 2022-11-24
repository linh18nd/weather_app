import 'dart:async';

import 'package:weather_app/src/data/controller.dart/bloc/weather_state.dart';
import 'package:weather_app/src/data/models/city.dart';

import '../../models/weather.dart';

class WeatherBloc {
  //final WeatherState _state = WeatherState(, data);

  final StreamController<City> _eventController = StreamController<City>();
  final StreamController<WeatherState> _stateController =
      StreamController<WeatherState>();

  Stream<WeatherState> get stream => _stateController.stream;

  void add(City event) {
    _eventController.add(event);
  }

  WeatherBloc() {
    //_stateController.add(_state);
    _eventController.stream.listen((event) {
      getWeatherData(event);
    });
  }

  void getWeatherData(City event) async {
    _stateController
        .add(WeatherState(event, await getWeatherFromBackend(event)));
  }
}
