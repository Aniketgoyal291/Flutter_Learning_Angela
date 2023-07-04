import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  final apiKey = '6347e5e71c5d2163254a3a777714a1c5';

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=-$longitude&appid=$apiKey',
      ),
    );
    if (response.statusCode == 200) {
      print('status code 200');
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temp = decodedData['list'][0]['main']['temp'];
      int condition = decodedData['list'][0]['weather'][0]['id'];
      String city = 'Tornoto'; // this is garbage value

      print(temp);
      print(condition);
      print(city);
    } else {
      print('did not get the api key');
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String myMargin = '10';
    // double? myMarginAsAString;
    // try {
    //   myMarginAsAString = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    // }
    getLocation();
    return const Scaffold();
  }
}
