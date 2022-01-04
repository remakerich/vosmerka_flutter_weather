part of 'weather.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.fetch(String city) = WeatherFetchEvent;
}
