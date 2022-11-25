import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/data/controller.dart/provider/weather_controller.dart';
import 'package:weather_app/src/data/models/weather.dart';
import 'package:weather_app/src/ui/widgets/weather_forecast.dart';
import 'package:provider/provider.dart';
import '../../data/models/city.dart';

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
        Builder(builder: (context) {
          String background = context.watch<WeatherController>().isDay()
              ? 'assets/background/day_sky.png'
              : 'assets/background/night_sky.png';
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
        //ElevatedButton(onPressed: () {}, child: Text(data.name)),
        Forecast(
          data: context.watch<WeatherController>().weather,
        )
      ],
    );
  }
}
