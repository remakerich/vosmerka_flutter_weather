class City {
  late String cityName;
  late String weatherPicture;
  late String temperature;

  City.fromJson(Map<String, dynamic> data) {
    cityName = data['name'];

    switch (data['weather'][0]['main']) {
      case 'Clouds':
        weatherPicture = 'assets/clouds.svg';
        break;
      case 'Clear':
        weatherPicture = 'assets/sun.svg';
        break;
      default:
        weatherPicture = 'assets/rain.svg';
    }

    temperature = data['main']['temp'].toInt().toString();
  }

  City.emptyCity({String name = ''}) {
    cityName = name;
    weatherPicture = 'assets/clouds.svg';
    temperature = 0.toString();
  }
}
