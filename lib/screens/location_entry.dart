import 'package:flutter/material.dart';
import 'package:weather/screens/loading.dart';
import 'package:weather/shared/styles.dart';

class LocationEntry extends StatefulWidget {

  @override
  _LocationEntryState createState() => _LocationEntryState();
}

class _LocationEntryState extends State<LocationEntry> {
  String _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Enter your location',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('assets/egypt_map.jpg'),
                fit:BoxFit.scaleDown
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                DropdownButton(
                  hint: Text(
                    'Choose your city',
                    style: labelStyle,
                  ),
                  style: labelStyle,
                  //////////icon: Icon(Icons.location_on, color: Color.fromRGBO(179, 179, 0, 1)),
                  value: _city,
                  onChanged: (val) {
                    setState(() {
                      _city = val;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Alexandria',
                        //style: labelStyle,
                      ),
                      value: 'Alexandria',
                      onTap: () {
                        setState(() {
                          _city = 'Alexandria';
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Cairo',
                        style: labelStyle,
                      ),
                      value: 'Cairo',
                      onTap: () {
                        setState(() {
                          _city = 'Cairo';
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Ismailia',
                        style: labelStyle,
                      ),
                      value: 'Ismailia',
                      onTap: () {
                        setState(() {
                          _city = 'Ismailia';
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Menia',
                        style: labelStyle,
                      ),
                      value: 'Menia',
                      onTap: () {
                        setState(() {
                          _city = 'Menia';
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Sinai',
                        style: labelStyle,
                      ),
                      value: 'Sinai',
                      onTap: () {
                        setState(() {
                          _city = 'Sinai';
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Text(
                        'Suez',
                        style: labelStyle,
                      ),
                      value: 'Suez',
                      onTap: () {
                        setState(() {
                          _city = 'Suez';
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 440,),
            Container(
              height: 70,
              width: 170,
              child: RaisedButton(
                textColor: Color.fromRGBO(179, 179, 0, 1),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  if(_city == null){

                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Loading(city: _city, showCurrentWeather: true,)));
                  }
                },
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
