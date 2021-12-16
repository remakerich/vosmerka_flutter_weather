
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vosmerka_flutter_weather/bloc/weather_bloc.dart';
import 'package:vosmerka_flutter_weather/styles/styles.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({Key? key}) : super(key: key);
  static const String routeName = '/city_weather';
  final String _degreeSign = 'o';
  final double _landscapeGap = 10;

  Widget _textInfoBlock(String temperature, String city) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          city,
          style: AppStyles.cityNameOnWeatherScreen,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temperature,
              style: AppStyles.temperature,
              textAlign: TextAlign.center,
            ),
            Text(
              _degreeSign,
              style: AppStyles.degreeSign,
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final city = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherIsNotSearched) {
          return Container();
        } else if (state is WeatherIsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherIsLoaded) {
          Widget _weatherPicture() {
            if (state.cityResult.weather == 'Clouds') {
              return SvgPicture.asset('assets/clouds.svg');
            }
            if (state.cityResult.weather == 'Clear') {
              return SvgPicture.asset('assets/sun.svg');
            }
            return SvgPicture.asset('assets/rain.svg');
          }

          final orientation = MediaQuery.of(context).orientation;
          if (orientation == Orientation.landscape) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _weatherPicture(),
                SizedBox(width: _landscapeGap),
                _textInfoBlock(state.cityResult.temperature, city)
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _weatherPicture(),
              _textInfoBlock(state.cityResult.temperature, city)
            ],
          );
        }
        return const Center(
          child: Text("something went wrong"),
        );
      }),
    );
  }
}

    // final city = ModalRoute.of(context)!.settings.arguments as String;

    

    // return Scaffold(
    //   body: FutureBuilder<Response>(
    //       future: http.get(Uri.parse(OpenWeatherAPI.endpointURL(city))),
    //       builder: (context, snapshot) {
    //         if (!snapshot.hasData) {
    //           return const Center(child: CircularProgressIndicator());
    //         } else {
    //           final weather = City.fromJson(snapshot.data);
    //          


// class CityWeather extends StatelessWidget {
//   const CityWeather({Key? key}) : super(key: key);
//   static const String routeName = '/city_weather';
//   final String _degreeSign = 'o';
//   final double _landscapeGap = 10;

//   @override
//   Widget build(BuildContext context) {
//     final city = ModalRoute.of(context)!.settings.arguments as String;

//     Widget _textInfoBlock(String temperature) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             city,
//             style: AppStyles.cityNameOnWeatherScreen,
//             textAlign: TextAlign.center,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 temperature,
//                 style: AppStyles.temperature,
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 _degreeSign,
//                 style: AppStyles.degreeSign,
//               )
//             ],
//           )
//         ],
//       );
//     }

//     return Scaffold(
//       body: FutureBuilder<Response>(
//           future: http.get(Uri.parse(OpenWeatherAPI.endpointURL(city))),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(child: CircularProgressIndicator());
//             } else {
//               final weather = City.fromJson(snapshot.data);
//               Widget _weatherPicture() {
//                 if (weather.weather == 'Clouds') {
//                   return SvgPicture.asset('assets/clouds.svg');
//                 }
//                 if (weather.weather == 'Clear') {
//                   return SvgPicture.asset('assets/sun.svg');
//                 }
//                 return SvgPicture.asset('assets/rain.svg');
//               }

//               final orientation = MediaQuery.of(context).orientation;
//               if (orientation == Orientation.landscape) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _weatherPicture(),
//                     SizedBox(width: _landscapeGap),
//                     _textInfoBlock(weather.temperature)
//                   ],
//                 );
//               }
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _weatherPicture(),
//                   _textInfoBlock(weather.temperature)
//                 ],
//               );
//             }
//           }),
//     );
//   }
// }
