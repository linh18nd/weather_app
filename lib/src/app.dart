import 'package:flutter/material.dart';
import 'package:weather_app/src/data/models/city.dart';
import 'package:weather_app/src/ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuildAppBar(),
    );
  }
}

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(
        city: City("Hanoi", 29, 82),
      ),

      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 95, 94, 92),
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           showSearch(context: context, delegate: SearchBar());
      //         },
      //         icon: const Icon(Icons.search))
      //   ],
      //   title: const Center(child: Text("Weather App")),
      // ),
    );
  }
}
