import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:waktu_solat/model/prayer_times_model.dart';
import 'package:waktu_solat/services/get_address_services.dart';
import 'package:waktu_solat/services/get_prayer_times_services.dart';
import 'package:waktu_solat/services/helper.dart';
import 'package:waktu_solat/view_model/location_view_model.dart';

class ListPrayerTimesViewModel {
  DateTime now = DateTime.now();
  Map<String, dynamic> details = {};

  Future<Map<String, dynamic>> getPrayerTimes() async {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    String date = dateFormatter.format(now);

    Position location = await LocationViewModel().getLocation();
    final Object object = await GetAddressServices().getCityCountry(location);
    final Timings res =
        await GetPrayerTimesServices().getPrayerTime(date, object);
    final Map<String, dynamic> prayerDetails = Helper().different(res);

    return details = {
      'prayerDetails': prayerDetails,
      'prayerTimes': res.toJson()
    };
  }
}
