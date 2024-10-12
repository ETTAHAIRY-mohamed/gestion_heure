import 'package:flutter/material.dart';
import 'package:gestion_heure/pages/Home.dart';
import 'package:gestion_heure/pages/Loading.dart';
import 'package:gestion_heure/pages/chooseLocation.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(const Home());
}
 
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/" : (context) =>  Loading(),
       "/home" : (context) =>  Home_page(),
        "/location" : (context) =>  Location(),
      }, 

    );
  }
}
