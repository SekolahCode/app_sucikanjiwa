import 'dart:convert';

import 'package:http/http.dart' as http;

class PrayerTimes {
  late List prayerTimesData;
  late Map<String, dynamic> query;
  String basedUrl = 'waktu-solat.test';
  Map<String, String> headersRequest = {'Accept': 'aplication/json'};

  /// description: get daily prayer times;
  /// @param String date
  /// @param Int zoneId
  Future<List> daily(date, zoneId) async {
    String path = 'api/daily';
    query['date'] = date;
    query['zone_id'] = zoneId;

    Uri url = Uri.http(basedUrl, path, query);

    http.Response res = await http.get(url, headers: headersRequest);

    return prayerTimesData = jsonDecode(res.body);
  }
}
