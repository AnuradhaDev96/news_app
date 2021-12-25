import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/Model/weather.dart';

@immutable 
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather): super([weather]);
}
