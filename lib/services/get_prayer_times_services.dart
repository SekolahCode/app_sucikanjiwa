import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/prayer_times_model.dart';

class GetPrayerTimesServices {
  Future<Timings> getPrayerTime(date, address) async {
    String basedUrl = 'api.aladhan.com';
    String path = 'v1/timingsByCity';
    Map<String, dynamic> query = {};
    Map<String, String> headersRequest = {'Accept': 'aplication/json'};

    query['date'] = date ?? '22-02-2022';
    query['city'] = address['city'] ?? 'Sepang';
    query['country'] = address['country'] ?? 'Malaysia';
    query['method'] = '8';

    Uri url = Uri.http(basedUrl, path, query);

    http.Response res = await http.get(url, headers: headersRequest);
    Map<String, dynamic> map = jsonDecode(res.body);
    Data data = Data.fromJson(map['data']);

    Timings timings = Timings(
        fajr: data.timings.fajr,
        sunrise: data.timings.sunrise,
        dhuhr: data.timings.dhuhr,
        asr: data.timings.asr,
        sunset: data.timings.sunset,
        maghrib: data.timings.maghrib,
        isha: data.timings.isha,
        imsak: data.timings.imsak,
        midnight: data.timings.midnight);

    return timings;
  }
}
