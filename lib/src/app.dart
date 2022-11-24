import 'package:flutter/material.dart';

import 'package:weather_app/src/ui/screens/search_bar.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                showSearch(context: context, delegate: SearchBar());
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Weather App"),
      ),
    );
  }
}
