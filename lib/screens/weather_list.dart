import 'package:flutter/material.dart';
import 'package:weather/shared/strings.dart';
import 'package:weather/shared/styles.dart';

class WeatherList extends StatefulWidget {

  List date;
  List tempDay;
  List tempNight;
  List description;
  List icon;
  WeatherList({ this.date, this.tempDay, this.tempNight, this.description, this.icon });
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {

  List<Widget> buildList(){
    List <Widget> tiles = [];
    for(int i = 0; i < 8; i++){
      tiles.add(
          SizedBox(height: 30,)
      );
      tiles.add(
        ListTile(
          leading: Image.network(CURRENT_WEATHER_ICON + widget.icon[i] + '@2x.png'),
          title: Text(
            '${widget.date[i]}\n'
                '${widget.tempDay[i]}\t/\t${widget.tempNight[i]}',
            style: dateStyle,
          ),
          subtitle: Text(
            widget.description[i],
            style: decriptionWeeklyStyle,
          ),
        ),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buildList(),
    );

  }
}
