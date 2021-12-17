import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:vosmerka_flutter_weather/network/api_key_from_assets.dart';
import 'package:vosmerka_flutter_weather/network/city_entity.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/weather')
abstract class ApiService {
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
        receiveTimeout: 30000,
        connectTimeout: 30000,
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
}
