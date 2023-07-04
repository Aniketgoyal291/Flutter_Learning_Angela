import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getLocation() async {
  Location location = Location();

  await location.getCurrentLocation();

  print(location.latitude);
  print(location.longitude);
}

void getData() async {
  http.Response response = await http.get(
    Uri.parse(
        'https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1'),
  );
  if (response.statusCode == 200) {
    String data = response.body;
    print(data);
  } else {
    print(response.statusCode);
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
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
    getData();
    return const Scaffold();
  }
}
