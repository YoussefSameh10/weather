import 'package:flutter/material.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/shared/strings.dart';
import 'package:weather/shared/styles.dart';

class CurrentWeather extends StatefulWidget {

  String temp;
  String description;
  String icon;
  String city;
  AssetImage bgImg;
  CurrentWeather({ this.temp, this.description, this.icon, this.city, this.bgImg });

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {

  TextStyle cityNameStyle;
  TextStyle tempStyle;
  TextStyle descriptionStyle;


  @override
  Widget build(BuildContext context) {

    if(widget.icon.substring(widget.icon.length - 1) == 'd'){
      cityNameStyle = cityNameDayStyle;
      tempStyle = tempDayStyle;
      descriptionStyle = descriptionDayStyle;
    }else{
      cityNameStyle = cityNameNightStyle;
      tempStyle = tempNightStyle;
      descriptionStyle = descriptionNightStyle;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Current Weather'
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: widget.bgImg,
            fit:BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 24, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.city,
                style: cityNameStyle,
              ),
              SizedBox(height: 20,),
              Text(
                widget.temp,
                style: tempStyle,
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Image.network(CURRENT_WEATHER_ICON + widget.icon + '@2x.png'),
                  SizedBox(width: 10,),
                  Text(
                    widget.description,
                    style: descriptionStyle,
                  )
                ],
              ),
              SizedBox(height: 90,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        onTap: (index) {
          if(index == 1){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loading(
              city: widget.city,
              showCurrentWeather: false,
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
          )
        ],
        currentIndex: 0,
      ),
    );
  }
}
