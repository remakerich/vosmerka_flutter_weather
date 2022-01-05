import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/bloc/weather.dart';
import 'package:vosmerka_flutter_weather/utils/service_locator.dart';

class WeatherUpdateStatus extends StatelessWidget {
  WeatherUpdateStatus({Key? key}) : super(key: key);

  final state = locator.get<WeatherBloc>().state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: state.when(
            loading: (_) => [
                  Container(
                      margin: const EdgeInsets.all(8),
                      height: 20,
                      width: 20,
                      child: const CircularProgressIndicator()),
                  const Text('Обновление данных')
                ],
            ready: (_) => [Container()],
            error: (_) => [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                  const Text('Ошибка. Проверьте подключение к Интернет.'),
                ]),
      ),
    );
  }
}
