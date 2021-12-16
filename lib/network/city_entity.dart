class City {
  late String cityName;
  String weatherPicture = 'assets/clouds.svg';
  String temperature = '0';

  City({
    required this.cityName,
  });

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
}
