import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestion_heure/data_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map receivedData = {};

  @override
  Widget build(BuildContext context) {
    receivedData = receivedData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : receivedData;
    String day = receivedData["isDay"] ? "day.png" : "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(153, 3, 0, 0),
          image: DecorationImage(
            image:
                AssetImage('a/$day'), // Assurez-vous que le chemin est correct
            fit: BoxFit.cover, // L'image couvre tout l'écran
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  // dynamic result =
                  //     await Navigator.pushNamed(context, '/location');
                  // if (kDebugMode) {
                  //   print(result);
                  // }
                  // setState(() {
                  //   receivedData = {
                  //     "time": result["time"],
                  //     "zone": result["zone"],
                  //     "isDay": result["isDay"]
                  //   };
                  // });
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: const Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(146, 119, 101, 225)),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(22)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                color: const Color.fromARGB(153, 3, 0, 0),
                width: 355,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      receivedData["time"],
                      style: const TextStyle(fontSize: 33, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      receivedData["zone"],
                      style: const TextStyle(fontSize: 33, color: Colors.white),
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
