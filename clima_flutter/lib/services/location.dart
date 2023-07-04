import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    /// All this code is to ensure that the user has given the permission to
    /// access the location to our app and the location is onn at the moment.
    // var servicePermission = await Geolocator.isLocationServiceEnabled();
    // if (!servicePermission) {
    //   print('permission denied');
    // }
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    // }
    try {
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
