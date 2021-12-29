import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vosmerka_flutter_weather/network/api_service.dart';
import 'package:vosmerka_flutter_weather/network/city_entity.dart';

class WeatherEvent {}

class WeatherState {}

class FetchWeather extends WeatherEvent {
  final String _city;
  FetchWeather(this._city);
}

class WeatherIsLoading extends WeatherState {
  final City _weather;
  WeatherIsLoading(this._weather);

  City get cityResult => _weather;
}

class WeatherIsLoaded extends WeatherState {
  final City _weather;
  WeatherIsLoaded(this._weather);

  City get cityResult => _weather;
}

class WeatherLoadingError extends WeatherState {
  final City _weather;
  WeatherLoadingError(this._weather);

  City get cityResult => _weather;
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherIsLoading(City.emptyCity())) {
    on<FetchWeather>(_onFetchWeather);
  }

  Map<String, City> cachedCities = {};

  void _onFetchWeather(event, emit) async {
    City city = City(cityName: event._city);

    if (cachedCities[event._city] != null) {
      city = cachedCities[event._city]!;
      emit(WeatherIsLoading(city));

      try {
        city = await ApiService(Dio(), city: event._city).getWeather();
        cachedCities[event._city] = city;

        emit(WeatherIsLoaded(city));
      } catch (e) {
        emit(WeatherLoadingError(city));
      }
    } else {
      emit(WeatherIsLoading(city));

      try {
        city = await ApiService(Dio(), city: event._city).getWeather();
        cachedCities[event._city] = city;
        emit(WeatherIsLoaded(city));
      } catch (e) {
        emit(WeatherLoadingError(city));
      }
    }
  }
}
