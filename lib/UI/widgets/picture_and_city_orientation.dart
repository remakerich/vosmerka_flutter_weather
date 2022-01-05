import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vosmerka_flutter_weather/UI/widgets/city_and_temperature.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';
import 'package:vosmerka_flutter_weather/utils/service_locator.dart';

class PictureAndWeatherOrientation extends StatelessWidget {
  PictureAndWeatherOrientation({Key? key}) : super(key: key);

  final double _landscapeGap = 10;
  final data = locator.get<WeatherBloc>().state.weather;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(data.weatherPicture),
          SizedBox(width: _landscapeGap),
          CityNameAndTemperature(),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(data.weatherPicture),
        CityNameAndTemperature(),
      ],
    );
  }
}
