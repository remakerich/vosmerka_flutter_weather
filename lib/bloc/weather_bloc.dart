import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_repo.dart';
import 'package:vosmerka_flutter_weather/models/city.dart';

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

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final City _weather;
  WeatherIsLoaded(this._weather);

  City get cityResult => _weather;

  @override
  List<Object?> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepo) : super(WeatherIsLoading());

  List<City> cachedCities = [];

  WeatherRepo weatherRepo;
  WeatherState get initialState => WeatherIsLoading();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();
      try {
        if (cachedCities.map((item) => item.cityName).contains(event._city)) {
          for (var cachedCity in cachedCities) {
            if (cachedCity.cityName == event._city) {
              print('weather is loaded from RAM');
              yield WeatherIsLoaded(cachedCity);
              City city = await weatherRepo.getWeather(event._city);
              cachedCities.remove(cachedCity);
              cachedCities.add(city);
              print('weather is fetched from API');

              yield WeatherIsLoaded(city);
            }
          }
        } else {
          yield WeatherIsLoaded(City(cityName: event._city));
          City city = await weatherRepo.getWeather(event._city);
          cachedCities.add(city);
          yield WeatherIsLoaded(city);
        }
      } catch (e) {
        yield WeatherIsNotLoaded();
      }
    }
  }
}
