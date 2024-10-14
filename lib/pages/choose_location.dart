import 'package:flutter/material.dart';
import 'package:gestion_heure/commun_pages/demo.dart';

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

var tasks = [
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
      title: "Saoudi Arabia",
      logo: "a/sa.png",
      url: 'https://worldtimeapi.org/api/timezone/Asia/Riyadh'),
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
      logo: "a/south-africa.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Johannesburg'),
  Task(
      title: "Tunisia",
      logo: "a/tunisia.png",
      url: 'https://worldtimeapi.org/api/timezone/Africa/Tunis')
];

class _LocationState extends State<Location> {
  Allcountries onecountry = Allcountries();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 223, 233),
        appBar: AppBar(
          title: const Text("choose location "),
          backgroundColor: const Color.fromARGB(192, 64, 115, 255),
        ),
        body: ListView(children: [
          for (int i = 0; i < tasks.length; i++)
            Demo(
              title: tasks[i].title,
              logo: tasks[i].logo,
              url: tasks[i].url,
              get: () async {
                // Call the function to fetch the data for the specific URL
                await onecountry.getData(tasks[i].url);
                if (context.mounted) {
                  Navigator.pop(context, {
                    "time": onecountry.timeNow,
                    "zone": onecountry.timeZone,
                    "isDay": onecountry.isDay
                  });
                }
                // Update UI after fetching the data
                setState(() {});
              },
            )
        ]));
  }
}
