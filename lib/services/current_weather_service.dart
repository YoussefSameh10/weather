import 'dart:convert';
import 'package:weather/shared/strings.dart';
import 'package:http/http.dart';
import 'package:weather/shared/utils.dart';


class CurrentWeatherService{
  String temp;
  String description;
  String icon;
  String city;
  double lon;
  double lat;

  CurrentWeatherService({ this.city });
  Future<void> getCurrentWeather() async {
    Response response = await get(CURRENT_WEATHER_API + 'q=$city&appid=$APP_ID');
    Map data = jsonDecode(response.body);
    Map main = data['main'];
    Map weather = data['weather'][0];
    Map coord = data['coord'];
    temp = celsius((main['temp']).toDouble());
    description = weather['description'];
    icon = weather['icon'];
    lon = coord['lon'];
    lat = coord['lat'];


  }
}