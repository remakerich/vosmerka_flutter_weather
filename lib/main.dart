import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';
import 'package:vosmerka_flutter_weather/data/providers/open_weather_api.dart';
import 'UI/screens/city_list.dart';
import 'UI/screens/city_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService.getApiKey();

    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case CityWeather.routeName:
              return MaterialPageRoute(builder: (_) => const CityWeather());
            default:
              return MaterialPageRoute(builder: (_) => const CityList());
          }
        },
      ),
    );
  }
}
