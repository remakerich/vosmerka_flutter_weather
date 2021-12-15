import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vosmerka_flutter_weather/api/openweather_api.dart';
import 'package:vosmerka_flutter_weather/models/city.dart';
import 'package:vosmerka_flutter_weather/styles/styles.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';

  @override
  Widget build(BuildContext context) {
    final city = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: FutureBuilder<Response>(
        future: http.get(Uri.parse(OpenWeatherAPI.endpointURL(city))),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final weather = City.fromJson(snapshot.data);
            return Text(
              weather.weather + '\n' + city + '\n' + weather.temperature + '°',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            );
          }
        },
      )),
    );
  }
}
