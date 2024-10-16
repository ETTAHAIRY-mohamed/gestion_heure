import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestion_heure/commun_pages/getdata.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String timeNow = '';
  String timeZone = '';


  @override
  void initState() {
    super.initState();
    getDataLoading(); // Call getData when the widget is initialized
  }

  getDataLoading() async {
  
      
      Allcountries onecountry = Allcountries();
         await onecountry.getData('http://worldtimeapi.org/api/timezone/Africa/Casablanca');

    // After data is fetched, navigate to '/home'
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "time": onecountry.timeNow,
        "zone": onecountry.timeZone,
        "isDay": onecountry.isDay
      });
    } 
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFadingCircle(
        color: Color.fromARGB(146, 12, 16, 49),
        size: 160.0,
      )),
    );
  }
}
