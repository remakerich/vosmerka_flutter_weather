import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_repo.dart';
import 'package:vosmerka_flutter_weather/screens/city_list.dart';
import 'package:vosmerka_flutter_weather/screens/city_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherRepo()),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case CityWeather.routeName:
              return MaterialPageRoute(
                  settings: settings, builder: (_) => const CityWeather());
            default:
              return MaterialPageRoute(
                  settings: settings, builder: (_) => const CityList());
          }
        },
      ),
    );
  }
}
