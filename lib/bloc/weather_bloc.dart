import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vosmerka_flutter_weather/network/api_service.dart';
import 'package:vosmerka_flutter_weather/models/city.dart';

class WeatherEvent {}

class WeatherState {
  final City _weather;
  WeatherState(this._weather);

  City get cityResult => _weather;
}

class FetchWeather extends WeatherEvent {
  final String _city;
  FetchWeather(this._city);
}

class WeatherIsLoading extends WeatherState {
  WeatherIsLoading(City weather) : super(weather);
}

class WeatherIsLoaded extends WeatherState {
  WeatherIsLoaded(City weather) : super(weather);
}

class WeatherLoadingError extends WeatherState {
  WeatherLoadingError(City weather) : super(weather);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState(City.emptyCity())) {
    on<FetchWeather>(_onFetchWeather);
  }

  Map<String, City> cachedCities = {};

  void _onFetchWeather(FetchWeather event, emit) async {
    City city = City.emptyCity(name: event._city);

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
