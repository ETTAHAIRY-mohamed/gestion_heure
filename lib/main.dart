import 'package:flutter/material.dart';
import 'package:gestion_heure/pages/home.dart';
import 'package:gestion_heure/pages/loading.dart';
import 'package:gestion_heure/pages/choose_location.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home_page(),
        "/location": (context) => const Location(),
      },
    );
  }
}
