import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/models/city.dart';

class SearchBar extends SearchDelegate {
  List<City> citys = [];
  //SearchBar.info(this.citys);

  void _getData(String query) async {
    citys = await getCityFromBackend(query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != '') {
      _getData(query);
    }

    return ListView.builder(
      itemCount: citys.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(citys[index].name),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != '') {
      _getData(query);
    }

    return ListView.builder(
      itemCount: citys.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(citys[index].name),
          onTap: () {},
        );
      },
    );
  }
}
