import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

// consts
const api = "25a8d0ba25d995b51a9abb7eec5c00c3";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;
  @override
  void initState() {
    getlocation();
  }

  void getlocation() async {
    WeatherModel weather = WeatherModel();
    var data = await weather.getweatherdata();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 100,
        ),
      ),
    );
  }
}
