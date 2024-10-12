import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart'; // Use 'as http' to avoid naming conflicts

class Allcountries {
  String timeNow = "";
  String timeZone = "";
  late bool isDay;
  
  // Fetch data for a specific URL
  Future<void> getData(String url) async {
    try {
      Response receivedDataFromAPI = await get(Uri.parse(url));
      Map receivedData = jsonDecode(receivedDataFromAPI.body);

      DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
      int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

      DateTime realTime = datetime.add(Duration(hours: offset));
      isDay = realTime.hour > 5 && realTime.hour < 18;

      timeNow = DateFormat('hh:mm a').format(realTime);
      timeZone = receivedData["timezone"];
      
      print("Time: $timeNow, Timezone: $timeZone, Daytime: $isDay");
    } catch (e) {
      print("Error: $e");
    }
  }
}
