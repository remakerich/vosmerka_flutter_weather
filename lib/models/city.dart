import 'dart:convert';

import 'package:http/http.dart';

class City {
  late String cityName;
  String weatherPicture = 'assets/clouds.svg';
  String temperature = '0';

  City({
    required this.cityName,
  });

  City.fromJson(Response? data, String city) {
    cityName = city;
    final json = jsonDecode(data!.body);

    switch (json['weather'][0]['main']) {
      case 'Clouds':
        weatherPicture = 'assets/clouds.svg';
        break;
      case 'Clear':
        weatherPicture = 'assets/sun.svg';
        break;
      default:
        weatherPicture = 'assets/rain.svg';
    }

    temperature = json['main']['temp'].toInt().toString();
  }
}
