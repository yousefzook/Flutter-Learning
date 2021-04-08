import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: false,
          timeLimit: Duration(seconds: 20));
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
