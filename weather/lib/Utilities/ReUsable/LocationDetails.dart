import 'package:geocoding/geocoding.dart';
import 'package:weather/Utilities/Constants.dart';

class LocationDetails {
  Future<List<Placemark>> getAddress({double? lat, double? long}) async {
  
    placemarks = await placemarkFromCoordinates(lat!, long!);
    print(placemarks);
    return placemarks;
  }
}
