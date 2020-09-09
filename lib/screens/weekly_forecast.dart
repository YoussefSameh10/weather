import 'package:flutter/material.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/shared/strings.dart';
import 'package:weather/shared/styles.dart';

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
        child: ListView(
          children: <Widget>[

            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[0] + '@2x.png'),
              title: Text(
                '${widget.date[0]}\n'
                '${widget.tempDay[0]}\t/\t${widget.tempNight[0]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[0],
                style: decriptionWeeklyStyle,
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[1] + '@2x.png'),
              title: Text(
                '${widget.date[1]}\n'
                '${widget.tempDay[1]}\t/\t${widget.tempNight[1]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[1],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[2] + '@2x.png'),
              title: Text(
                '${widget.date[2]}\n'
                '${widget.tempDay[2]}\t/\t${widget.tempNight[2]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[2],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[3] + '@2x.png'),
              title: Text(
                '${widget.date[3]}\n'
                '${widget.tempDay[3]}\t/\t${widget.tempNight[3]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[3],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[4] + '@2x.png'),
              title: Text(
                '${widget.date[4]}\n'
                '${widget.tempDay[4]}\t/\t${widget.tempNight[4]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[4],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[5] + '@2x.png'),
              title: Text(
                '${widget.date[5]}\n'
                '${widget.tempDay[5]}\t/\t${widget.tempNight[5]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[5],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[6] + '@2x.png'),
              title: Text(
                '${widget.date[6]}\n'
                '${widget.tempDay[6]}\t/\t${widget.tempNight[6]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[6],
                style: decriptionWeeklyStyle
              ),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[7] + '@2x.png'),
              title: Text(
                '${widget.date[7]}\n'
                '${widget.tempDay[7]}\t/\t${widget.tempNight[7]}',
                style: dateStyle,
              ),
              subtitle: Text(
                widget.description[7],
                style: decriptionWeeklyStyle
              ),
            ),
          ],
        ),
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
