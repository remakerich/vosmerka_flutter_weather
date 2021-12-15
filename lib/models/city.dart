import 'dart:convert';

import 'package:http/http.dart';

class City {
  String weather = '';
  String temperature = '';
  City.fromJson(Response? data) {
    final json = jsonDecode(data!.body);
    weather = json['weather'][0]['main'];
    temperature = json['main']['temp'].toInt().toString();
  }
}
