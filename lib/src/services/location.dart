import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late bool serviceEnabled;
  late LocationPermission permission;

  /// Determine and return the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future<Position?>` will return null.
  Future<Position?> getPosition() async {
    try {
      // Verify that services are enabled and
      // Verify that access to location
      await verifyPermissions();
    } catch (e) {
      // Print Exception
      debugPrint(e.toString());
      return null;
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // (Option 2) await Geolocator.getLastKnownPosition()
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
      ),
    );
  }

  /// Verifies whether location services are enabled on the device.
  /// Also verifies if the user allows the App to access the device's location.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error Exception.
  Future<void> verifyPermissions() async {
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(Exception('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(Exception('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        Exception(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
    }
  }
}
