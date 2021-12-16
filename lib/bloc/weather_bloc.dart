import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:vosmerka_flutter_weather/network/api_service.dart';
import 'package:vosmerka_flutter_weather/network/city_entity.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String _city;

  FetchWeather(this._city);

  @override
  List<Object?> get props => [_city];
}

class WeatherIsLoading extends WeatherState {
  final City _weather;
  WeatherIsLoading(this._weather);

  City get cityResult => _weather;

  @override
  List<Object?> get props => [_weather];
}

class WeatherIsLoaded extends WeatherState {
  final City _weather;
  WeatherIsLoaded(this._weather);

  City get cityResult => _weather;

  @override
  List<Object?> get props => [_weather];
}

class WeatherLoadingError extends WeatherState {
  final City _weather;
  WeatherLoadingError(this._weather);

  City get cityResult => _weather;

  @override
  List<Object?> get props => [_weather];
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherIsLoading(City(cityName: "")));

  Map<String, City> cachedCities = {};

  WeatherState get initialState => WeatherIsLoading(City(cityName: ""));

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      City city = City(cityName: event._city);

      if (cachedCities[event._city] != null) {
        city = cachedCities[event._city]!;
        yield WeatherIsLoading(city);

        try {
          city = await ApiService(Dio(), city: event._city).getWeather();
          cachedCities[event._city] = city;

          yield WeatherIsLoaded(city);
        } catch (e) {
          yield WeatherLoadingError(city);
        }
      } else {
        yield WeatherIsLoading(city);

        try {
          city = await ApiService(Dio(), city: event._city).getWeather();
          cachedCities[event._city] = city;
          yield WeatherIsLoaded(city);
        } catch (e) {
          yield WeatherLoadingError(city);
        }
      }
    }
  }
}
