import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/fonts/fonts.dart';
import 'package:vosmerka_flutter_weather/network/api_service.dart';
import 'package:vosmerka_flutter_weather/screens/city_weather.dart';

class CityList extends StatelessWidget {
  const CityList({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
        body: ListView.builder(
      itemCount: ApiService.cities.length,
      itemBuilder: (context, index) {
        final city = ApiService.cities[index];
        return ListTile(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              city,
              style: AppFonts.cityListItem,
            ),
          )),
          onTap: () {
            weatherBloc.add(FetchWeather(city));

            Navigator.of(context)
                .pushNamed(CityWeather.routeName, arguments: city);
          },
        );
      },
    ));
  }
}
