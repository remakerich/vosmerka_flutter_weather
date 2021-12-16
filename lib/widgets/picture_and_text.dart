import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vosmerka_flutter_weather/widgets/text.dart';

class PictureAndText extends StatelessWidget {
  const PictureAndText(
      {required this.city,
      required this.weatherPicture,
      required this.temperature,
      Key? key})
      : super(key: key);

  final String city;
  final String weatherPicture;
  final String temperature;
  final double _landscapeGap = 10;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(weatherPicture),
          SizedBox(width: _landscapeGap),
          WeatherText(city: city, temperature: temperature)
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(weatherPicture),
        WeatherText(city: city, temperature: temperature),
      ],
    );
  }
}
