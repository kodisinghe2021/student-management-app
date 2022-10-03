import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:geocoding/geocoding.dart';
import 'package:proacadamy_student_management_app/components/aler.dart';

class LocationProvider with ChangeNotifier {
  //--------------------User Location provider

  Position? _position;

//keep address deatils
  List<Placemark> _placemarks = [];

  List<Placemark> get getPlaceMark => _placemarks;

// getter for get position details
  Position? get getUserCoordinates => _position;

//get distance
  double get getDistance => _distance / 1000;
// extract address from placemark list
  String get getAddress =>
      "${_placemarks[0].name},${_placemarks[0].street},${_placemarks[0].locality},${_placemarks[0].country}}, ";

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  Future<Position> _determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Logger().e('Location services are disabled.');
      errorAlert(context, 'Error', 'Location services are disabled.', (() {
        Navigator.pop(context);
      }));
      return Future.error('Location services are disabled.');
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
        errorAlert(context, 'Error','Location permissions are denied', (() {
        Navigator.pop(context);
      }));
        Logger().e('Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      errorAlert(context, 'Error', 'Location permissions are permanently denied, we cannot request permissions.', (() {
        Navigator.pop(context);
      }));
      Logger().e(
          'Location permissions are permanently denied, we cannot request permissions.');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  //get user coordinates
  Future<void> setUSerCoordinates(BuildContext context) async {
    try {
      //store the given coordinates by method
      _position = await _determinePosition(context);

      // fetch coordinates
      _placemarks = await placemarkFromCoordinates(
          _position!.latitude, _position!.longitude);

      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

// get distancebetween two location
  double _distance = 0.0;
  Future<void> findDistance() async {
    try {
      _distance = Geolocator.distanceBetween(
        _position!.latitude,
        _position!.longitude,
        6.9361,
        79.8450,
      );
    } catch (e) {
      Logger().i(e);
    }
    notifyListeners();
  }
}
