class OpenWeatherAPI {
  static const _apiKey = 'a3d77f43f166bfd1905b1c53e6f92aaf';
  static String endpointURL(String city) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
  }
}
