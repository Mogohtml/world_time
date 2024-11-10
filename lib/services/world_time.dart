import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; //location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDayTime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get(Uri.parse(
          'https://www.timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data['dateTime'];
      String one_time = data['time'].substring(1, 2);
      //print(dateTime);
      //print(time);

      // create DataTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(one_time)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}


