part of 'weather.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading(City weather) = _WeatherLoading;
  const factory WeatherState.ready(City weather) = _WeatherReady;
  const factory WeatherState.error(City weather) = _WeatherError;
}