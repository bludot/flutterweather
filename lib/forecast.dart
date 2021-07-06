import 'package:flutter/material.dart';

class ForecastWeatherContainer extends StatefulWidget {
  ForecastWeatherContainer() : super();

  @override
  _ForecastWeatherContainerState createState() =>
      _ForecastWeatherContainerState();
}

class _ForecastWeatherContainerState extends State<ForecastWeatherContainer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        left: 24.0,
        right: 24.0,
        child: Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue.withAlpha(25),
                  child: Text("test")))
        ]));
  }
}
