import 'dart:convert';
import 'package:weather/services/current_weather_service.dart';
import 'package:weather/shared/strings.dart';
import 'package:http/http.dart';
import 'package:weather/shared/utils.dart';

class WeeklyForecastService {


  List date = [];
  List tempDay = [];
  List tempNight = [];
  List description = [];
  List icon = [];
  String city;

  WeeklyForecastService({ this.city });

  Future<void> getWeeklyForecast() async {

    CurrentWeatherService instance = CurrentWeatherService(city: city);
    await instance.getCurrentWeather();
    double lat = instance.lat;
    double lon = instance.lon;

    Response response = await get(WEEKLY_FORECAST_API + 'lat=$lat&lon=$lon&exclude=current,minutely,hourly&appid=$APP_ID');
    Map data = jsonDecode(response.body);
    List weather = data['daily'];

    for(int i = 0; i<8; i++){
      String x = DateTime.fromMillisecondsSinceEpoch(weather[i]['dt'] * 1000).toString();
      int j = x.indexOf(' ');
      x = x.substring(0, j);
      date.add(x);
      tempDay.add(celsius((weather[i]['temp']['day']).toDouble()));
      tempNight.add(celsius((weather[i]['temp']['night']).toDouble()));
      description.add(weather[i]['weather'][0]['description']);
      icon.add(weather[i]['weather'][0]['icon']);
    }

  }

}