import 'package:geolocator/geolocator.dart';

import '../models/exam.dart';

class LocationService {

  static bool isUserNearExam(Position userPosition, Exam exam) {
    double distance = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      exam.locationLatitude,
      exam.locationLongitude,
    );

    return distance < 100;
  }

  static Future<Position> getUserLocation() async {

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {

      throw Exception("Location permission denied");
    }


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
