import 'package:location/location.dart';

class LocationPermissions {
  Location location = Location();

  Future<bool> getServicePerm() async {
    bool? _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool> getLocPerm() async {
    PermissionStatus? _permissionGranted = await location.hasPermission();
    print(_permissionGranted);
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<LocationData> getLatLong() async {
    LocationData? _currentPosition = await location.getLocation();
    return _currentPosition;
  }
}
