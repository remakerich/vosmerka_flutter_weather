import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/UI/widgets/weather_and_status.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        return state.when(
          loading: (loading) {
            return WeatherAndStatus(
                isLoaded: false,
                isError: false,
                cityName: loading.cityName,
                weatherPicture: loading.weatherPicture,
                temperature: loading.temperature);
          },
          ready: (result) {
            return WeatherAndStatus(
                isLoaded: true,
                isError: false,
                cityName: result.cityName,
                weatherPicture: result.weatherPicture,
                temperature: result.temperature);
          },
          error: (error) {
            return WeatherAndStatus(
                isLoaded: false,
                isError: true,
                cityName: error.cityName,
                weatherPicture: error.weatherPicture,
                temperature: error.temperature);
          },
        );
      }),
    );
  }
}
