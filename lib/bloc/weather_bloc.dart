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

class WeatherIsNotLoaded extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepo) : super(WeatherIsLoading(City(cityName: "")));

  List<City> cachedCities = [];

  WeatherRepo weatherRepo;
  WeatherState get initialState => WeatherIsLoading(City(cityName: ""));

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      if (cachedCities.map((item) => item.cityName).contains(event._city)) {
        for (var cachedCity in cachedCities) {
          if (cachedCity.cityName == event._city) {
            // retrieved cached data from RAM
            yield WeatherIsLoading(cachedCity);

            try {
              City city = await weatherRepo.getWeather(event._city);
              cachedCities.remove(cachedCity);
              cachedCities.add(city);
              print('weather is fetched from API');

              yield WeatherIsLoaded(city);
            } catch (e) {
              yield WeatherIsNotLoaded();
            }
          }
        }
      } else {
        // if there's no cached data - loading with empty template
        // with city name, 0 degrees and 'Clouds' picture
        yield WeatherIsLoading(City(cityName: event._city));
        try {
          City city = await weatherRepo.getWeather(event._city);
          cachedCities.add(city);
          yield WeatherIsLoaded(city);
        } catch (e) {
          yield WeatherIsNotLoaded();
        }
      }

      // yield WeatherIsLoading(City(cityName: "Moscow"));
      // try {
      //   if (cachedCities.map((item) => item.cityName).contains(event._city)) {
      //     for (var cachedCity in cachedCities) {
      //       if (cachedCity.cityName == event._city) {}
      //     }
      //   } else {
      //     yield WeatherIsLoaded(City(cityName: event._city));
      //     City city = await weatherRepo.getWeather(event._city);
      //     cachedCities.add(city);
      //     yield WeatherIsLoaded(city);
      //   }
      // } catch (e) {
      //   yield WeatherIsNotLoaded();
      // }
    }
  }
}
