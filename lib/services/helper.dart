import 'package:intl/intl.dart';
import 'package:waktu_solat/model/prayer_times_model.dart';

class Helper {
  DateTime now = DateTime.now();
  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  Map<String, dynamic> different(Timings timings) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    Map<String, dynamic> details = {};
    var json = timings.toJson();
    json.remove('Sunset');
    json.remove('Midnight');

    for (var timing in json.entries) {
      String dateTime = formatter.format(now) + ' ' + timing.value + ':00';
      DateTime parseDateTime = DateTime.parse(dateTime);

      if (now.isBefore(parseDateTime)) {
        final int difference = parseDateTime.difference(now).inMinutes;
        final String diff = durationToString(difference);
        details['name'] = timing.key;
        details['different'] = diff;
        // details = {'name': timing.key, 'different': diff};
        break;
      }
    }

    return details;
  }
}
