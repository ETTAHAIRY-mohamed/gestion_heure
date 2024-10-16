import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  final cities = [
    'City1',
    'City2',
    'City3',
    // Add your cities here
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: getCities(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data == null) {
            return Center(child: Text('No results found.'));
          }
          final cities = snapshot.data as List<String>;
          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cities[index]),
              );
            },
          );
        }
      },
    );
  }

  Future<List<String>?> getCities(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'http://geodb-free-service.wirefreethought.com/v1/geo/cities?namePrefix=$query'));
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return (json['data'] as List)
            .map<String>((city) => city['city'] as String)
            .toList();
      } else {
        print('Error with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
