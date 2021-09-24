// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:realtime/pages/choose_location.dart';
import 'package:realtime/pages/home.dart';
import 'package:realtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => const ChooseLocation()
    },
  ));
}
