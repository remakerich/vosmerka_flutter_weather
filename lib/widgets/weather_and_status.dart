import 'package:flutter/material.dart';
import 'package:vosmerka_flutter_weather/widgets/picture_and_text.dart';

class WeatherAndStatus extends StatelessWidget {
  const WeatherAndStatus({
    required this.isLoaded,
    required this.isError,
    required this.cityName,
    required this.weatherPicture,
    required this.temperature,
    Key? key,
  }) : super(key: key);

  final bool isLoaded;
  final bool isError;
  final String cityName;
  final String weatherPicture;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PictureAndText(
          city: cityName,
          weatherPicture: weatherPicture,
          temperature: temperature),
      if (!isLoaded)
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isError
                    ? const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 25,
                      )
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator()),
              ),
              isError
                  ? const Text('Ошибка. Проверьте подключение к Интернет.')
                  : const Text('Обновление данных')
            ],
          ),
        )
    ]);
  }
}
