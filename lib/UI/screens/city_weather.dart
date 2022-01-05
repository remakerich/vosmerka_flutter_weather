import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/UI/widgets/picture_and_city_orientation.dart';
import 'package:vosmerka_flutter_weather/UI/widgets/update_status.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);

  static const String routeName = '/city_weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        context.watch<WeatherBloc>();

        return Stack(children: [
          PictureAndWeatherOrientation(),
          WeatherUpdateStatus(),
        ]);
      }),
    );
  }
}
