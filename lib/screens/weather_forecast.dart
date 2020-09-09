import 'package:flutter/material.dart';

class WeatherForecast extends StatefulWidget {
  String city;
  WeatherForecast({ this.city });

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Forecast',
        ),
      ),

    );
  }
}
