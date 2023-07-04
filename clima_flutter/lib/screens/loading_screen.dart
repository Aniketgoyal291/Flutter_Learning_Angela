import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.latitude);
  print(location.longitude);
  print(location.longitude);
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
    return const Scaffold();
  }
}
