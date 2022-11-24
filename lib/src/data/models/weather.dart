import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/src/data/models/city.dart';

class Weather {
  final String main;
  final String description;
  final String icon;
  Weather(
    this.main,
    this.description,
    this.icon,
  );
  factory Weather.fromJson(Map<String, dynamic> jsonObject) {
    return Weather(jsonObject['main'] as String,
        jsonObject["description"] as String, jsonObject["icon"] as String);
  }
}

class Main {
  final double temp;
  final int humidity;
  Main(this.temp, this.humidity);
  factory Main.fromJson(Map<String, dynamic> jsonObject) {
    return Main(jsonObject["temp"] as double, jsonObject["humidity"] as int);
  }
}

class Wind {
  final double speed;
  Wind(this.speed);
  factory Wind.fromJson(Map<String, dynamic> jsonObject) {
    return Wind(jsonObject["speed"] as double);
  }
}

class Data {
  final Weather weather;
  final Main main;
  final String name;
  final Wind wind;
  Data(this.name, this.main, this.weather, this.wind);
  factory Data.formJson(Map<String, dynamic> jsonObject) {
    final jsonMain = jsonObject["main"];
    Main main = Main.fromJson(jsonMain);
    final jsonWeather = jsonObject["weather"];
    Weather weather = Weather.fromJson(jsonWeather[0]);

    return Data(jsonObject["name"] as String, main, weather,
        Wind.fromJson(jsonObject["wind"]));
  }
}

Map<String, dynamic> convertFromJsonToMap(String jsonString) {
  final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;
  return jsonObject;
}

Future<Data> getWeatherFromBackend(City city) async {
  String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=${city.lat}&lon=${city.lon}&lang=vi&appid=9ee05338ba287fbcbdde929e3e39b99c";
  final uri = Uri.parse(url);
  try {
    final response = await get(uri);
    final jsonString = response.body;
    final jsonData = convertFromJsonToMap(jsonString);
    final Data data = Data.formJson(jsonData);
    return data;
  } catch (e) {
    rethrow;
  }
}
