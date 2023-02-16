import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/controller.dart/provider/weather_controller.dart';
import 'package:weather_app/src/data/models/weather.dart';
import 'package:weather_app/src/ui/widgets/forecast_card.dart';

import '../screens/search_bar.dart';

class Forecast extends StatelessWidget {
  final Data data;
  const Forecast({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Spacer(),
          // const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.network(
                  "http://openweathermap.org/img/wn/${data.weather.icon}@2x.png",
                  fit: BoxFit.contain,
                ),
              ),
              Text("${data.main.temp.toInt()}",
                  style: Theme.of(context).textTheme.headline1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("°C", style: Theme.of(context).textTheme.headline3),
                  Text(data.weather.main,
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
            ],
          ),
          //const Spacer(),
          ForecastCard(
            data: data,
          ),
        ],
      ),
    );
  }
}
