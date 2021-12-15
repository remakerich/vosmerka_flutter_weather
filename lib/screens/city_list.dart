import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/main.dart';
import 'package:vosmerka_flutter_weather/screens/city_weather.dart';
import 'package:vosmerka_flutter_weather/styles/styles.dart';

class CityList extends StatelessWidget {
  const CityList({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return ListTile(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.all(AppStyles.listItemPadding),
            child: Text(
              city,
              style: AppStyles.title,
            ),
          )),
          onTap: () => Navigator.of(context)
              .pushNamed(CityWeather.routeName, arguments: city),
        );
      },
    ));
  }
}
