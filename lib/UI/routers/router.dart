import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/UI/screens/city_list.dart';
import 'package:vosmerka_flutter_weather/UI/screens/city_weather.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CityWeather.routeName:
        return MaterialPageRoute(builder: (_) => const CityWeather());
      default:
        return MaterialPageRoute(builder: (_) => const CityList());
    }
  }
}
