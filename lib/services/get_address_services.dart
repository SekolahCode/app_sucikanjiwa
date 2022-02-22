import 'package:geocoding/geocoding.dart';

class GetAddressServices {
  Future<String> fromLatLong(location) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      Placemark place = placemarks[0];

      // "${place.locality}, ${place.postalCode}, ${place.country}";
      return "${place.locality}";
    } catch (e) {
      rethrow;
    }
  }

  Future<Object> getCityCountry(location) async {
    Object object = {};
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      Placemark place = placemarks[0];

      object = {'city': "${place.locality}", 'country': "${place.country}"};
      return object;
    } catch (e) {
      rethrow;
    }
  }
}
