import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../data/models/weather.dart';
import '../screens/search_bar.dart';

class ForecastCard extends StatelessWidget {
  final Data data;
  const ForecastCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      color: const Color.fromARGB(72, 114, 130, 129),
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      // child: Container(
      //   width: 300,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(30.0),
      //     color: Color.fromARGB(255, 146, 221, 222),
      //   ),
      child: Column(
        children: [
          TextButton(
            onPressed: () async {
              showSearch(context: context, delegate: SearchBar());
            },
            child:
                Text(data.name, style: Theme.of(context).textTheme.headline3),
          ),
          Text(data.weather.description,
              style: Theme.of(context).textTheme.headline5),
          const Divider(
            indent: 70,
            endIndent: 70,
            thickness: 2,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Độ ẩm", style: Theme.of(context).textTheme.headline4),
                  Text("${data.main.humidity}%",
                      style: Theme.of(context).textTheme.headline4),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    "Gió",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text("${data.wind.speed} m/s",
                      style: Theme.of(context).textTheme.headline4),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
