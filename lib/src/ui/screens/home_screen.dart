import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/data/controller.dart/provider/weather_controller.dart';
import 'package:weather_app/src/data/models/weather.dart';
import 'package:weather_app/src/ui/utils/weather_forecast.dart';
import 'package:provider/provider.dart';
import '../../data/models/city.dart';

Data data = Data(
    "London", Main(20.0, 20), Weather("Cloudy", "Cloudy", "01d"), Wind(30.0));
City city = City("Ha Noi", 21, 105.8);

class Home extends StatelessWidget {
  final City city;
  const Home({super.key, required this.city});
  void getData(Data data) async {
    data = await getWeatherFromBackend(city);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/night_sky.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        //ElevatedButton(onPressed: () {}, child: Text(data.name)),
        Forecast(
          data: context.watch<WeatherController>().weather,
        )
      ],
    );
  }
}
