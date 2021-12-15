import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vosmerka_flutter_weather/api/openweather_api.dart';
import 'package:vosmerka_flutter_weather/models/city.dart';
import 'package:vosmerka_flutter_weather/styles/styles.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';
  final String _degreeSign = 'o';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final city = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<Response>(
        future: http.get(Uri.parse(OpenWeatherAPI.endpointURL(city))),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            double height = AppBar().preferredSize.height;
            final weather = City.fromJson(snapshot.data);
            print(weather.weather);
            Widget _weatherPicture() {
              if (weather.weather == 'Clouds') {
                return SvgPicture.asset('assets/clouds.svg');
              }
              if (weather.weather == 'Clear') {
                return SvgPicture.asset('assets/sun.svg');
              }
              return SvgPicture.asset('assets/rain.svg');
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _weatherPicture(),
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
                      weather.temperature,
                      style: AppStyles.temperature,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _degreeSign,
                      style: AppStyles.degreeSign,
                    )
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
