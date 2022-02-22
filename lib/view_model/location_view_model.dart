import 'package:geolocator/geolocator.dart';
import 'package:waktu_solat/services/get_location_services.dart';

class LocationViewModel {
  Future<Position> getLocation() async {
    final Position res = await GetLocationServices().getCurrentPosition();
    return res;
  }
}
