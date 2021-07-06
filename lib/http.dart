import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

import 'package:weather/currentWeather.dart';

class HttpAPI {
  String baseURL = "http://localhost:8080";
  HttpAPI() : super();
  Future<CurrentWeather> getCurrentWeather({location: Position}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var url = Uri.parse(baseURL + "/current");
    var response = await http.post(url,
        body: json.encode({
          'longitude': location.longitude,
          'latitude': location.latitude,
        }),
        headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return CurrentWeather.fromJson(jsonDecode(response.body)['current']);
  }
}
