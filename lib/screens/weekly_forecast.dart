import 'package:flutter/material.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/shared/strings.dart';

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
                'Day: ${widget.tempDay[0]}\t\t\t\t\t Night: ${widget.tempNight[0]}'
              ),
              subtitle: Text(widget.description[0]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[1] + '@2x.png'),
              title: Text(
                  '${widget.date[1]}\n'
                      'Day: ${widget.tempDay[1]}\t\t\t\t\t Night: ${widget.tempNight[1]}'
              ),
              subtitle: Text(widget.description[1]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[2] + '@2x.png'),
              title: Text(
                  '${widget.date[2]}\n'
                      'Day: ${widget.tempDay[2]}\t\t\t\t\t Night: ${widget.tempNight[2]}'
              ),
              subtitle: Text(widget.description[2]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[3] + '@2x.png'),
              title: Text(
                  '${widget.date[3]}\n'
                      'Day: ${widget.tempDay[3]}\t\t\t\t\t Night: ${widget.tempNight[3]}'
              ),
              subtitle: Text(widget.description[3]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[4] + '@2x.png'),
              title: Text(
                  '${widget.date[4]}\n'
                      'Day: ${widget.tempDay[4]}\t\t\t\t\t Night: ${widget.tempNight[4]}'
              ),
              subtitle: Text(widget.description[4]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[5] + '@2x.png'),
              title: Text(
                  '${widget.date[5]}\n'
                      'Day: ${widget.tempDay[5]}\t\t\t\t\t Night: ${widget.tempNight[5]}'
              ),
              subtitle: Text(widget.description[5]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[6] + '@2x.png'),
              title: Text(
                  '${widget.date[6]}\n'
                      'Day: ${widget.tempDay[6]}\t\t\t\t\t Night: ${widget.tempNight[6]}'
              ),
              subtitle: Text(widget.description[6]),
            ),
            SizedBox(height: 30,),
            ListTile(
              leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[7] + '@2x.png'),
              title: Text(
                  '${widget.date[7]}\n'
                      'Day: ${widget.tempDay[7]}\t\t\t\t\t Night: ${widget.tempNight[7]}'
              ),
              subtitle: Text(widget.description[7]),
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
