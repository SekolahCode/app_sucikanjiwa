import 'package:geolocator/geolocator.dart';
import 'package:waktu_solat/services/get_address_services.dart';
import 'package:waktu_solat/view_model/location_view_model.dart';

class AddressViewModel {
  Future<String> getAddress() async {
    Position location = await LocationViewModel().getLocation();
    final String city = await GetAddressServices().fromLatLong(location);

    return city;
  }
}
