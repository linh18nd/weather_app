import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/src/data/models/weather.dart';

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
              Text(
                "${data.main.temp.toInt()}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 160, 154, 154),
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "°C",
                    style: TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.weather.main,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () async {
              showSearch(context: context, delegate: SearchBar());
            },
            child: Text(data.name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 160, 154, 154),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const Divider(
            indent: 70,
            endIndent: 70,
            thickness: 2,
            color: Color.fromARGB(255, 160, 154, 154),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    "Humidity",
                    style: TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${data.main.humidity}%",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text(
                    "Wind",
                    style: TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${data.wind.speed} m/s",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 160, 154, 154),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
