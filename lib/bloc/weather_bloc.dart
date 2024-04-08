import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/data/repository/weather_data_repository.dart';
import 'package:weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
    final WeatherReposotory weatherReposotory;
  WeatherBloc(this.weatherReposotory) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  //-----------Function handle state--------//  
  void _getCurrentWeather(WeatherFetched event, Emitter<WeatherState> emit) async {
      emit(WeatherLoading());
      try {
            final weather = await weatherReposotory.getCurrentWeather();
            emit(WeatherSuccess(weatherModel: weather));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
      }
  }
}
