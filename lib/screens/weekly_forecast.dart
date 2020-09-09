import 'package:flutter/material.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/screens/weather_list.dart';

class WeeklyForecast extends StatefulWidget {

  List date;
  List tempDay;
  List tempNight;
  List description;
  List icon;
  String city;
  AssetImage bgImg;

  WeeklyForecast({ this.date, this.tempDay, this.tempNight, this.description, this.icon, this.city, this.bgImg });

  @override
  _WeeklyForecastState createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends State<WeeklyForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
            widget.city
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(
                image: widget.bgImg,
                fit:BoxFit.cover
            )
        ),
        child: WeatherList(
          date: widget.date,
          tempDay: widget.tempDay,
          tempNight: widget.tempNight,
          description: widget.description,
          icon: widget.icon,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        onTap: (index) {
          if(index == 0){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loading(
              city: widget.city,
              showCurrentWeather: true,
            )));
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Current Weather'),
            icon: Icon(Icons.wb_cloudy),
          ),
          BottomNavigationBarItem(
            title: Text('Weekly Forecast'),
            icon: Icon(Icons.assignment),
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}
