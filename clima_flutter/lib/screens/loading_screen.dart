import 'package:flutter/material.dart';
import 'location_screen.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Location location = Location();
    // await location.getCurrentLocation();
    //
    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    // NetworkHelper networkHelper = NetworkHelper(url: url);
    // var weatherData = await networkHelper.getData();

    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
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
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
