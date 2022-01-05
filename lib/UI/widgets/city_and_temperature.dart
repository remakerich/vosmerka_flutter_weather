import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/UI/fonts/fonts.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';
import 'package:vosmerka_flutter_weather/utils/service_locator.dart';

class CityNameAndTemperature extends StatelessWidget {
  CityNameAndTemperature({Key? key}) : super(key: key);

  final String _degreeSign = 'o';
  final data = locator.get<WeatherBloc>().state.weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data.cityName,
          style: AppFonts.cityNameOnWeatherScreen,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.temperature,
              style: AppFonts.temperature,
              textAlign: TextAlign.center,
            ),
            Text(
              _degreeSign,
              style: AppFonts.degreeSign,
            )
          ],
        )
      ],
    );
  }
}
