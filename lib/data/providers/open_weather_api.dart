import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:retrofit/http.dart';
import 'package:vosmerka_flutter_weather/data/models/city.dart';

part 'open_weather_api.g.dart';

// to build generated code: flutter pub run build_runner build

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/weather')
abstract class ApiService {
  static late final String apiKey;

  static const List<String> cities = [
    "Краснодар",
    "Москва",
    "Санкт-Петербург",
    "Омск",
    "Новый Орлеан",
    "Нью-Дели",
    "Алжир",
  ];

  factory ApiService(
    Dio dio, {
    required String city,
  }) {
    dio.options = BaseOptions(
        receiveTimeout: 3000,
        connectTimeout: 3000,
        contentType: 'application/json',
        queryParameters: {
          'q': city,
          'appid': apiKey,
          'units': 'metric',
          'lang': 'ru',
        });

    return _ApiService(dio);
  }

  @GET('')
  Future<City> getWeather();

  static getApiKey() async {
    final _apiKeyFromAsset = await rootBundle.loadString('assets/api_key.json');
    apiKey = jsonDecode(_apiKeyFromAsset)['key'];
  }
}
