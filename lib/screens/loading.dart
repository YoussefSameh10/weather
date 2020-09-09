import 'package:flutter/material.dart';
import 'package:weather/screens/current_weather.dart';
import 'package:weather/screens/weekly_forecast.dart';
import 'package:weather/services/current_weather_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weekly_forecast_service.dart';

class Loading extends StatefulWidget {

  String city;
  bool showCurrentWeather;
  Loading({ this.city, this.showCurrentWeather });

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupCurrentWeather() async {
    CurrentWeatherService instance = CurrentWeatherService(city: widget.city);
    await instance.getCurrentWeather();
    AssetImage bgImg;
    if(instance.description == 'shower rain' || instance.description == 'rain' || instance.description == 'snow' || instance.description == 'heavy intensity rain' || instance.description == 'moderate rain' || instance.description == 'light rain'){
      if(instance.icon.substring(instance.icon.length - 1) == 'd'){
        bgImg = AssetImage('assets/rain_day.jpg');
      }else{
        bgImg = AssetImage('assets/rain_night.jpg');
      }
    }else if(instance.description == 'few clouds' || instance.description == 'scattered clouds' || instance.description == 'broken clouds' || instance.description == 'mist'){
      if(instance.icon.substring(instance.icon.length - 1) == 'd'){
        bgImg = AssetImage('assets/cloudy_day.jpg');
      }else{
        bgImg = AssetImage('assets/cloudy_night.jpg');
      }
    }else if(instance.description == 'clear sky'){
      if(instance.icon.substring(instance.icon.length - 1) == 'd'){
        bgImg = AssetImage('assets/clear_day.jpg');
      }else{
        bgImg = AssetImage('assets/clear_night.jpg');
      }
    }else if(instance.description == 'thunderstorm'){
      bgImg = AssetImage('assets/thunderstorm.jpg');
    }else{
      bgImg = AssetImage('assets/bg_vec.png');
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CurrentWeather(
      temp: instance.temp,
      description: instance.description,
      icon: instance.icon,
      city: widget.city,
      bgImg: bgImg,
    )));
  }

  void setupWeeklyForecast() async {
    WeeklyForecastService instance = WeeklyForecastService(city: widget.city);
    await instance.getWeeklyForecast();
    AssetImage bgImg;
    if(instance.description[0] == 'shower rain' || instance.description[0] == 'rain' || instance.description[0] == 'snow' || instance.description[0] == 'heavy intensity rain' || instance.description[0] == 'moderate rain' || instance.description[0] == 'light rain'){
      if(instance.icon[0].substring(instance.icon[0].length - 1) == 'd'){
        bgImg = AssetImage('assets/rain_day.jpg');
      }else{
        bgImg = AssetImage('assets/rain_night.jpg');
      }
    }else if(instance.description[0] == 'few clouds' || instance.description[0] == 'scattered clouds' || instance.description[0] == 'broken clouds' || instance.description[0] == 'mist'){
      if(instance.icon[0].substring(instance.icon[0].length - 1) == 'd'){
        bgImg = AssetImage('assets/cloudy_day.jpg');
      }else{
        bgImg = AssetImage('assets/cloudy_night.jpg');
      }
    }else if(instance.description[0] == 'clear sky'){
      if(instance.icon[0].substring(instance.icon[0].length - 1) == 'd'){
        bgImg = AssetImage('assets/clear_day.jpg');
      }else{
        bgImg = AssetImage('assets/clear_night.jpg');
      }
    }else if(instance.description[0] == 'thunderstorm'){
      bgImg = AssetImage('assets/thunderstorm.jpg');
    }else{
      bgImg = AssetImage('assets/bg_vec.png');
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeeklyForecast(
      date: instance.date,
      tempDay: instance.tempDay,
      tempNight: instance.tempNight,
      description: instance.description,
      icon: instance.icon,
      city: widget.city,
      bgImg: bgImg,
    )));
  }

  @override
  void initState() {
    super.initState();
    if(widget.showCurrentWeather){
      setupCurrentWeather();
    }else{
      setupWeeklyForecast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[500],
        body: Center(
            child: SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}
