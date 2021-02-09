import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String url;
  String flag;
  String time;

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

      time = now.toString();
      print(time);
    } catch (e) {
      print(e.toString());
      time = " Unable Load time.";
    }
  }
}
