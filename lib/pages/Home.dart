import 'package:flutter/material.dart';
import 'dart:convert';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    Map receivedData = ModalRoute.of(context)!.settings.arguments as Map;
    String  day = receivedData["isDay"]? "day.png": "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(153, 3, 0, 0),
          
          image: DecorationImage(
              
            image: 
            AssetImage('a/${day}'), // Assurez-vous que le chemin est correct
            fit: BoxFit.cover, // L'image couvre tout l'écran
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
             dynamic result = await Navigator.pushNamed(context, '/location');
             setState(() {
               
             });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 119, 101, 225)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                color: Color.fromARGB(153, 3, 0, 0),
                width: 350,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      receivedData["time"],
                      style: TextStyle(fontSize: 33, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      receivedData["zone"],
                      style: TextStyle(fontSize: 33, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
