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

  WeatherRepo weatherRepo;
  WeatherState get initialState => WeatherIsLoading();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();
      try {
        City city = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(city);
      } catch (e) {
        yield WeatherIsNotLoaded();
      }
    }
  }
}
