import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:vosmerka_flutter_weather/models/city.dart';

class WeatherRepo {
  static const List<String> cities = [
    "Краснодар",
    "Москва",
    "Санкт-Петербург",
    "Омск",
    "Новый Орлеан",
    "Нью-Дели",
    "Рим",
  ];

  Future<City> getWeather(String city) async {
    final _apiKeyFromAsset = await rootBundle.loadString('assets/api_key.json');
    final _apiKey = jsonDecode(_apiKeyFromAsset)['key'];
    final _endpoint =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
    final result = await http.Client().get(Uri.parse(_endpoint));
    final City weather = City.fromJson(result);

    return weather;
  }
}
