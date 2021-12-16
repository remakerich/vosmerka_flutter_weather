import 'dart:convert';

import 'package:http/http.dart';

class City {
  late String weatherPicture;
  late String temperature;
  City.fromJson(Response? data) {
    final json = jsonDecode(data!.body);

    String assetName = 'assets/rain.svg';

    switch (json['weather'][0]['main']) {
      case 'Clouds':
        assetName = 'assets/clouds.svg';
        break;
      case 'Clear':
        assetName = 'assets/sun.svg';
        break;
    }
    weatherPicture = assetName;
    temperature = json['main']['temp'].toInt().toString();
  }
}
