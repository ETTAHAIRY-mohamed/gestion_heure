import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
<<<<<<< HEAD
    
    final String title;
    final String logo;
    final String url;
    Function get;
    Demo({super.key, required this.title,required this.logo,required this.url , required this.get});
    
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(22),
          margin: const EdgeInsets.all(22),
          color: const Color.fromARGB(123, 7, 7, 255),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(logo),
              ),
              onTap: () {
                 get();
                 
              },
              title: Text(
                title,
                style: const TextStyle(fontSize: 19, color: Colors.black),
              ),
            ),
=======
  final String title;
  final String logo;
  final String url;
  Function get;
  Demo(
      {super.key,
      required this.title,
      required this.logo,
      required this.url,
      required this.get});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.all(22),
      color: const Color.fromARGB(123, 7, 7, 255),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(logo),
>>>>>>> origin/main
          ),
          onTap: () {
            get();
          },
          title: Text(
            title,
            style: const TextStyle(fontSize: 19, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
