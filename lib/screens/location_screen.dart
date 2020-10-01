import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/networking.dart';

class LocationScreen extends StatefulWidget {
  final locationweather;
  LocationScreen({@required this.locationweather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String api = "25a8d0ba25d995b51a9abb7eec5c00c3";
  WeatherModel weather = WeatherModel();
  String icon;
  String message;
  int tempreture;
  String city;
  var popvalue;
  @override
  void initState() {
    updatepi(widget.locationweather);
  }

  void updatepi(dynamic weatherdate) {
    setState(() {
      double temp = weatherdate['main']['temp'];
      tempreture = temp.toInt();
      var condition = weatherdate['weather'][0]['id'];
      icon = weather.getWeatherIcon(condition);
      message = weather.getMessage(tempreture);
      city = weatherdate['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      dynamic data = await weather.getweatherdata();
                      updatepi(data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      popvalue = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      var citydata = await getcitydate(city);
                      updatepi(citydata);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '$tempreture° $icon',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 85.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Expanded(
                  child: Text(
                    "$message in $city",
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
