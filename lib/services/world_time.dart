import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String flag;
  String time;
  bool   isDay;

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      // Making API Request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      // Storing into a Map or Dict
      Map result = jsonDecode(response.body);
      // Extracting Properties as Strings
      String dateTime = result['datetime'];
      String offset = result['utc_offset'];
      offset = offset.substring(1, 3);
      //print(offset);
      //print('$time\n$offset');
      // Converting into Date Time Object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay = now.hour > 6 && now.hour<18? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e.toString());
      time = " Unable Load time.";
    }
  }
}
