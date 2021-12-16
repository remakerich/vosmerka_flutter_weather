## Задание

Реализовать погодное приложение, состоящее из 2 экранов:
1. Экран списка городов. Города жёстко прописаны в приложении. При нажатии на элемент списка открывается экран погоды.
2. Экран погоды. Отображает данные о погоде по выбранному городу. Можно использовать любое открытое API для загрузки данных.

При разработке необходимо использовать архитектуру Bloc, для загрузки дынных использовать библиотеки Dio + Retrofit. Необходимо также предусмотреть корректную работу приложения при отсутствии интернета.

Будет плюсом, если приложение будет корректно обрабатывать поворот экрана и обновлять интерфейс соответствующим образом.
https://www.figma.com/file/GFErbWHf91xg613PUo8ONT/Minimal-Weather-App-(Community)?node-id=0%3A1

## Решение
Приложение разработано для Android. Использовался SDK `Flutter 2.5.1`. Для запуска:
- добавьте файл `assets/api_key.json` как показано ниже в разделе "Экраны"

Ниже приведен разбор всех условий задания.

## Экраны

> 1. Экран списка городов. Города жёстко прописаны в приложении. При нажатии на элемент списка открывается экран погоды. 
> 2. Экран погоды. Отображает данные о погоде по выбранному городу. Можно использовать любое открытое API для загрузки данных.

Требуемые экраны реализованы. Переход на экран погоды осуществляется при нажатии на элемент списка. Переход назад на экран списка городов - нажатием на кнопку "назад" в нижней части экрана.
   В файле `lib/network/api_service.dart` находится массив из городов.

Для получения данных о погоде использовался API https://openweathermap.org/api.
   API ключ хранится в файле `assets/api_key.json` в следующем формате:

```json
{
  "key": "your_key"
}
```

Для получения API ключа вы можете самостоятельно бесплатно зарегистироваться на указанном выше сайте, либо обратиться по почте k.popovskikh@mail.ru.

## Bloc
> При разработке необходимо использовать архитектуру Bloc,

Постарался реализовать архитектуру Bloc.

При нажатии на элемент списка городов проиcходит:

- переход на экран погоды
- Вызов события `FetchWeather`

На экране погоды отрабатываются следующие состояния:

- `WeatherIsLoading` - запрос к API сделан но ответ еще не получен
- `WeatherIsLoaded` - получен ответ от API с корректными данными
- `WeatherLoadingError` - невозможно сделать запрос к API либо API возвращает некорректные данные

Реализация паттерна Bloc была сделана мной впервые. Ранее я использовал только стандартные `FutureBuilder` и `StreamBuilder`, а так же `ChangeNotifierProvider`. Однако мне понравилась концепция данного паттерна и я бы с удовольствием изучил его подробнее.
## Dio + Retrofit
> для загрузки дынных использовать библиотеки Dio + Retrofit.

Попробовал реализовать http запросы к API с помощью данных библиотек.

API ключ загружается в переменную `String apiKey` при запуске приложения и затем используется в файле `api_service.dart` при осуществлении запросов.

Пользовался данными библиотеками так же в первый раз. До этого использовал стандартный пакет `http`. 

Как мне кажется, библиотеки Dio и Retrofit могут сделать код запросов более структурированным. Поэтому я с радостью изучу их более подробно при необходимости.

## Работа приложения при отсутствии интернета
> Необходимо также предусмотреть корректную работу приложения при отсутствии интернета.

Попытался реализовать кеш данных в оперативной памяти:

1. При запуске приложения (когда кеш пуст) и переходе на экран погоды по умолчанию показывается "облачность" и 0 градусов.
2. В этот момент происходит запрос к API. В нижней части экрана отображается индикатор обновления:

![image](https://user-images.githubusercontent.com/85007290/146403654-aa8b5bb1-9cef-4371-af30-daa0541fa6d7.png)

4. После получения ответа от API экран изменяется и отображает актуальные данные о погоде.
5. Эти данные записываются в оперативную память (добавляются в структуру ` Map<String, City> cachedCities`).
6. Так же при открытии экрана погоды происходит проверка наличия выбранного города в кеше, поэтому если повторно открыть экран то сначала отобразятся данные из кеша (если они есть) а затем экран обновится на актуальные данные от API.
7. При отсутствии интернета или возникновении другой ошибки запроса к API, данные так же подгрузятся из кеша (либо будут показаны данные по умолчанию), а в нижней части экрана будет сообщение об ошибке:

![image](https://user-images.githubusercontent.com/85007290/146402701-75b9abb2-fbbe-4cdb-82ec-66129e769b88.png)

## Корректная обработка поворота экрана
> Будет плюсом, если приложение будет корректно обрабатывать поворот экрана и обновлять интерфейс соответствующим образом. https://www.figma.com/file/GFErbWHf91xg613PUo8ONT/Minimal-Weather-App-(Community)?node-id=0%3A1

В файле `lib/screens/city_weather.dart`, виждете `PictureAndWeather`, я постарался реализовать обработку поворота экрана в зависимости от `MediaQuery.of(context).orientation`:

![image](https://user-images.githubusercontent.com/85007290/146358156-3bbbc48c-088d-433b-abf3-c2c3e0179a99.png)
