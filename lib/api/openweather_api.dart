class OpenWeatherAPI {
  static const _apiKey = '';
  static String endpointURL(String city) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
  }
}
