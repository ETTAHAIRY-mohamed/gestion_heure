import 'package:flutter/material.dart';
import 'package:gestion_heure/commun_pages/demo.dart';

import 'package:gestion_heure/commun_pages/getdata.dart';
import 'package:gestion_heure/modules/task.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Allcountries onecountry = Allcountries();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      // here we will show the search input text and the auto completion of counties
      body: Container(
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
