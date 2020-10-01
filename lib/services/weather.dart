import 'dart:convert';

import 'location.dart';
import 'package:clima/services/networking.dart';
import 'package:http/http.dart' as http;

const api = "25a8d0ba25d995b51a9abb7eec5c00c3";
Future<dynamic> getcitydate(String city) async {
  String url =
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric';
  NetworkHelper data = NetworkHelper(url: url);
  var actualdata = await data.getApidata();
  return actualdata;
}

class WeatherModel {
  Future<dynamic> getweatherdata() async {
    Location location = Location();
    await location.getcurrentlocation();
    NetworkHelper net = await NetworkHelper(
        url:
            "http://api.openweathermap.org/data/2.5/weather?lat=${location.latt}&lon=${location.lang}&appid=$api&units=metric");
    var data = await net.getApidata();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
