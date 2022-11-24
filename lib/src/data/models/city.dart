import 'dart:convert';

import 'package:http/http.dart';

class City {
  final String name;
  final double lat;
  final double lon;
  City(this.name, this.lat, this.lon);
  factory City.fromJson(Map<String, dynamic> jsonObject) {
    return City(jsonObject["name"] as String, jsonObject["lat"] as double,
        jsonObject["lon"] as double);
  }
}

Map<String, dynamic> convertJsonToObject(String jsonData) {
  final jsonObject = jsonDecode(jsonData) as Map<String, dynamic>;
  return jsonObject;
}

List<City> convertJsonToListObject(String jsonString) {
  final jsonData = jsonDecode(jsonString) as List<dynamic>;
  List<City> citys = [];
  for (var city in jsonData) {
    citys.add(City.fromJson(city as Map<String, dynamic>));
  }
  return citys;
}

Future<List<City>> getCityFromBackend(String cityName) async {
  String url =
      "http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=100&appid=9ee05338ba287fbcbdde929e3e39b99c";

  final uri = Uri.parse(url);
  try {
    final response = await get(uri);
    final jsonString = response.body;
    final citys = convertJsonToListObject(jsonString);
    return citys;
  } catch (e) {
    rethrow;
  }
}
