import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/UI/fonts/fonts.dart';

class WeatherText extends StatelessWidget {
  const WeatherText({
    required this.city,
    required this.temperature,
    Key? key,
  }) : super(key: key);

  final String city;
  final String temperature;
  final String _degreeSign = 'o';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          city,
          style: AppFonts.cityNameOnWeatherScreen,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature,
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
