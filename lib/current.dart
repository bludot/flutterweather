import 'package:flutter/material.dart';

class CurrentWeatherBox extends StatefulWidget {
  CurrentWeatherBox() : super();

  @override
  _CurrentWeatherboxState createState() => _CurrentWeatherboxState();
}

class _CurrentWeatherboxState extends State<CurrentWeatherBox> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 24.0,
        left: 24.0,
        child: SizedBox(
            width: 200,
            height: 200,
            child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue.withAlpha(25),
                child: Text("test"))));
  }
}
