import 'package:flutter/material.dart';
import 'package:gestion_heure/commun_pages/demo.dart';
import 'dart:convert';

import 'package:gestion_heure/commun_pages/getdata.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class Task {
  final String title;
  final String logo;
  final String url;

  Task({required this.title, required this.logo, required this.url});
}

var Tasks = [
  Task(
      title: "Morocco",
      logo: "a/morocco.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Casablanca'),
  Task(
      title: "Australia",
      logo: "a/australia.png",
      url: 'https://worldtimeapi.org/api/timezone/Australia/Sydney'),
  Task(
      title: "Canada",
      logo: "a/canada.png",
      url: 'https://worldtimeapi.org/api/timezone/America/Toronto'),
  Task(
      title: "Egypt",
      logo: "a/egypt.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Cairo'),
  Task(
      title: "South Africa",
      logo: "a/sa.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Johannesburg'),
  Task(
      title: "Tunisia",
      logo: "a/tunisia.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Tunis'),
  Task(
      title: "Morocco",
      logo: "a/morocco.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Casablanca'),
  Task(
      title: "Australia",
      logo: "a/australia.png",
      url: 'https://worldtimeapi.org/api/timezone/Australia/Sydney'),
  Task(
      title: "Canada",
      logo: "a/canada.png",
      url: 'https://worldtimeapi.org/api/timezone/America/Toronto'),
  Task(
      title: "Egypt",
      logo: "a/egypt.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Cairo'),
  Task(
      title: "South Africa",
      logo: "a/sa.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Johannesburg'),
  Task(
      title: "Tunisia",
      logo: "a/tunisia.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Tunis')
];

class _LocationState extends State<Location> {
  @override
  Allcountries onecountrie = Allcountries();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 223, 233),
        appBar: AppBar(
          title: Text("choose location "),
          backgroundColor: Color.fromARGB(192, 64, 115, 255),
        ),
        body: ListView(
          children: [
            for (int i = 0; i < Tasks.length; i++)
              Demo(
                  title: Tasks[i].title,
                  logo: Tasks[i].logo,
                  url: Tasks[i].url,
                  get: () async {
                // Call the function to fetch the data for the specific URL
                await onecountrie.getData(Tasks[i].url);
                Navigator.pop(context,{
                  "time": onecountrie.timeNow,
                   "zone": onecountrie.timeZone,
                   "isDay":onecountrie.isDay
                });
                // Update UI after fetching the data
                setState(() {});
              },
              )
          ]
        ));
  }
}
