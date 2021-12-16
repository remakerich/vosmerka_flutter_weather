import 'package:http/http.dart' as http;
import 'package:vosmerka_flutter_weather/api/openweather_api.dart';
import 'dart:convert';

import 'package:vosmerka_flutter_weather/models/city.dart';

class WeatherRepo {
  Future<City> getWeather(String city) async {
    final result =
        await http.Client().get(Uri.parse(OpenWeatherAPI.endpointURL(city)));

    if (result.statusCode != 200) {
      print("not a 200 code");
    }

    final City weather = City.fromJson(result);

    return weather;
  }
}
