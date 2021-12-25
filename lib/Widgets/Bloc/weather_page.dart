import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Controller/bloc_weather/weather_bloc.dart';
import 'package:news_app/Controller/bloc_weather/weather_event.dart';
import 'package:news_app/Controller/bloc_weather/weather_state.dart';
import 'package:news_app/Model/weather.dart';
import 'package:provider/provider.dart';

//we can set statefulWidget as a child of statelessWidget
class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherBloc = WeatherBloc();

  @override
  void dispose() {
    super.dispose();
    _weatherBloc.dispose();
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '${weather.cityName}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '${weather.temperature.toStringAsFixed(1)} *C',
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocProvider(
          builder: (context) => _weatherBloc,
          child: BlocListener<WeatherBloc, WeatherState>(
            //declare a blocListener to listen to the state changes and refresh the state in dispose
            // bloc: _weatherBloc,
            listener: (context, WeatherState state) {
              if (state is WeatherLoaded) {
                print('${state.weather.temperature}');
              }
            },
            child: BlocBuilder<WeatherBloc, WeatherState>(
                // bloc: _weatherBloc,
                builder: (BuildContext context, WeatherState state) {
                  if (state is WeatherInitial) {
                    return BuildInitialInput();
                  } else if (state is WeatherLoading) {
                    return BuildLoading();
                  } else if (state is WeatherLoaded) {
                    return Container(
                      child: buildColumnWithData(state.weather),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}

class BuildInitialInput extends StatelessWidget {
  const BuildInitialInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CityInputField(),
    );
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

//in a stateless widget we cannot access buildcontext in its private method
//therefore we need to use a statefulwidget
class CityInputField extends StatefulWidget {
  const CityInputField({Key key}) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: _onSubmitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            hintText: 'Input a city name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }

  void _onSubmitCityName(String cityName) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.dispatch(GetWeather(cityName));
  }
}
