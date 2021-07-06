import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/current.dart';
import 'package:weather/currentWeather.dart';
import 'package:weather/forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/http.dart';
import 'package:weather/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HttpAPI api = new HttpAPI();
  LocationGetter locationGetter = new LocationGetter();
  late Position location;
  late CurrentWeather currentWeather;
  Future<Position> setPosition() async {
    location = await locationGetter.getLocation();
    return location;
  }

  @override
  Widget build(BuildContext context) {
    setPosition().then((position) async {
      currentWeather = await api.getCurrentWeather(location: location);
    });

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                //   width: MediaQuery.of(context).size.width,
                //  height: MediaQuery.of(context).padding.top,
                color: Colors.blue.withAlpha(25),
              ),
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      body: Stack(children: <Widget>[
        CurrentWeatherBox(),
        ForecastWeatherContainer()
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
