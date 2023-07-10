import 'package:http/http.dart';
import 'dart:convert';

class worker {
  String loc = "";
  //constructor
  worker({this.loc = ""}) {
    loc = this.loc;
  }

  String? temp;
  late String humidity;
  String? air_speed;
  String? description;
  String? main;

  //method
  Future<void> getdata() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$loc&appid=611ba3ac28a8e48d32ed7982ea6206e8"));

      Map data = jsonDecode(response.body);

      // temperature,humidity
      Map temp_data = data["main"];
      String get_temp = temp_data["temp"] - 273.15.toString();
      String get_humidity = temp_data["humidity"].toString();

      //description,main
      List weather_data = data['weather'];
      Map waether_main_data = weather_data[0];
      String get_description = waether_main_data['description'];
      String get_main = waether_main_data["main"];

      //speed
      Map speed_data = data["wind"];
      String get_speed = speed_data["speed"] / 0.27777777777778.toString();

      //assigning value
      temp = get_temp; //degree celsius
      humidity = get_humidity; //%
      air_speed = get_speed; //km/hr
      description = get_description;
      main = get_main;
    } catch (e) {
      //assigning value
      temp = "can't find data";
      humidity = "can't find data";
      air_speed = "can't find data";
      description = "can't find data";
      main = "can't find data";
    }
  }
}
