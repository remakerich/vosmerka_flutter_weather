import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vosmerka_flutter_weather/data/models/city.dart';
import 'package:vosmerka_flutter_weather/data/providers/open_weather_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.ready(City.emptyCity())) {
    on<WeatherFetchEvent>(_onFetchWeather);
  }

  Map<String, City> cachedCities = {};

  void _onFetchWeather(WeatherFetchEvent event, emit) async {
    City city = City.emptyCity(name: event.city);

    if (cachedCities[event.city] != null) {
      city = cachedCities[event.city]!;
      emit(WeatherState.loading(city));

      try {
        city = await ApiService(Dio(), city: event.city).getWeather();
        cachedCities[event.city] = city;

        emit(WeatherState.ready(city));
      } catch (e) {
        emit(WeatherState.error(city));
      }
    } else {
      emit(WeatherState.loading(city));

      try {
        city = await ApiService(Dio(), city: event.city).getWeather();
        cachedCities[event.city] = city;
        emit(WeatherState.ready(city));
      } catch (e) {
        emit(WeatherState.error(city));
      }
    }
  }
}
