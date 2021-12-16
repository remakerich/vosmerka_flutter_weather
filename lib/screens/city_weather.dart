import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/widgets/weather_and_status.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherIsLoading) {
          return WeatherAndStatus(
              isLoaded: false,
              isError: false,
              cityName: state.cityResult.cityName,
              weatherPicture: state.cityResult.weatherPicture,
              temperature: state.cityResult.temperature);
        }
        if (state is WeatherIsLoaded) {
          return WeatherAndStatus(
              isLoaded: true,
              isError: false,
              cityName: state.cityResult.cityName,
              weatherPicture: state.cityResult.weatherPicture,
              temperature: state.cityResult.temperature);
        }
        if (state is WeatherLoadingError) {
          return WeatherAndStatus(
              isLoaded: false,
              isError: true,
              cityName: state.cityResult.cityName,
              weatherPicture: state.cityResult.weatherPicture,
              temperature: state.cityResult.temperature);
        }
        return Container();
      }),
    );
  }
}
