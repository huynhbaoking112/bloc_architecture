import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherReposotory{
  final WeatherDataProvider weatherDataProvider;
  WeatherReposotory(this.weatherDataProvider);


   Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final String weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }


}