import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;
  NetworkHelper({@required this.url});
  Future<dynamic> getApidata() async {
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }
}

// String desc = json.decode(response.body)['weather'][0]['description'];
//     var name = json.decode(response.body)['name'];
//     var temp = json.decode(response.body)['main']['temp'];
//     print("Description : $desc");
//     print("Temp : $temp");
//     print("Name : $name");
