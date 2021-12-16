import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/styles/styles.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherIsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WeatherIsLoaded) {
          return PictureAndWeather(
              city: state.cityResult.cityName,
              weatherPicture: state.cityResult.weatherPicture,
              temperature: state.cityResult.temperature);
        }
        return const Center(
          child: Text("something went wrong"),
        );
      }),
    );
  }
}

class PictureAndWeather extends StatelessWidget {
  const PictureAndWeather(
      {required this.city,
      required this.weatherPicture,
      required this.temperature,
      Key? key})
      : super(key: key);

  final String city;
  final String weatherPicture;
  final String temperature;

  final double _landscapeGap = 10;
  final String _degreeSign = 'o';

  Widget _textInfoBlock() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          city,
          style: AppStyles.cityNameOnWeatherScreen,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature,
              style: AppStyles.temperature,
              textAlign: TextAlign.center,
            ),
            Text(
              _degreeSign,
              style: AppStyles.degreeSign,
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(weatherPicture),
          SizedBox(width: _landscapeGap),
          _textInfoBlock()
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(weatherPicture),
        _textInfoBlock(),
      ],
    );
  }
}
