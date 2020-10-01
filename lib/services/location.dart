import 'package:geolocator/geolocator.dart';

class Location {
  double latt;
  double lang;
  Future<void> getcurrentlocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latt = position.latitude;
      lang = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
