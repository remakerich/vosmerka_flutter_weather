import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/network/api_key_from_assets.dart';
import 'package:vosmerka_flutter_weather/screens/city_list.dart';
import 'package:vosmerka_flutter_weather/screens/city_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    getApiKey();
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
