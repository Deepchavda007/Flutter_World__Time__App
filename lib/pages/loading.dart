import 'package:flutter/material.dart';
import 'package:realtime/sevices/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart';
// import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // var time = 'Loading...';

  void setupWordTime() async {
    WorldTime instance =
        WorldTime(url: 'Europe/London', flag: 'japan.png', location: 'London');

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    // print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          size: 70.0,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.black : Colors.blueAccent,
                // using spinkit property flutter
              ),
            );
          },
        ),
      ),
    );
  }
}
