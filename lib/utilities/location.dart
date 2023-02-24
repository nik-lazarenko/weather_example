import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;



  Future<void> getCurrentLocation() async {

    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied ||
        permission != LocationPermission.deniedForever) {
      try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // print('Something goes wrong: $e');
      log('Something goes wrong: $e');
    }
    }
  }
}