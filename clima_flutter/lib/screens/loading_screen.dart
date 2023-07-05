import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  final apiKey = '6e01d87f1521cd1e2efc4ca5cc29b3bd';

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var decodedData = await networkHelper.getData();

    double temp = decodedData['main']['temp'];
    int condition = decodedData['weather'][0]['id'];
    String city = decodedData['name'];
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
    getLocationData();
    return const Scaffold();
  }
}
