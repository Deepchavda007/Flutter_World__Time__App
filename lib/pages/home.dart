// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/routes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  // var dat;

  // Map get dat => null;
  // Map dat = {};
  // ignore: prefer_typing_uninitialized_variables
  // var dc;

  @override
  Widget build(BuildContext context) {
    // ModalRoute<T>? of<T extends Object?>(BuildContext context)
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // data = dat;
    // Very impotant in ModalRoute (.. ! .
    // print(data);

    //bgimage set

    var bgImage = data['isDaytime'] ? '11.jpg' : '13.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blueAccent : Colors.indigo;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = <dynamic, dynamic>{
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                      size: 30.0,
                    ),
                    label: Text('Edit Location',
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.grey[200]))),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 25.0,
                        // fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    // color: Colors.blue,
                    fontSize: 50.0,
                    // fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
