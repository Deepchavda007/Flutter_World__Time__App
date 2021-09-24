// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  var location;
  var time;
  var flag;
  var isDaytime;
  var url;

  // ignore: prefer_typing_uninitialized_variables
  // var url1 = 'http://worldtimeapi.org/api/timezone/America/Argentina/Salta';

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make Request
      Uri urlUri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(urlUri);
      Map data = jsonDecode(response.body);
      // print(data);
      // print(response.body);

      // Get Properties From Data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);

      // Create dateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // print('Caught Error : $e');
      time = 'could not get a real time';
    }
  }
}
