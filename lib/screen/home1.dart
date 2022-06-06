import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weathertest/service/location.dart';

import '../model/data.dart';
import '../widget/container.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String key = "f3a6f2a2ee5dffc5949de6573c73f232";
  late WeatherFactory ws;
  late String jsonTags = "semda";
  //datos
  Data? data;
  late double temp = 1.1;
  late String descripcion = "s/n";
  late int humedad = 100;
  late String pais = "s/d";
  late String icon = "10d";
  late String cidade = "s/d";

  @override
  void initState() {
    ws = WeatherFactory(key, language: Language.PORTUGUESE_BRAZIL);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          children: [
          
            ContainerWidget(
              pais: pais,
              humedad: humedad,
              onPressed: queryWeather,
              temp: temp,
              description: descripcion,
              icon: icon,
              location: cidade,
            ),
          ],
        ),
      ),
    );
  }

  queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    Location location = Location();
    await location.getCurrentLocation();

    Weather weather = await ws.currentWeatherByLocation(
        location.latitude, location.longitude);

    setState(() {
      temp = weather.temperature!.celsius!;
      descripcion = weather.weatherDescription!;
      cidade = weather.areaName!;
      icon = weather.weatherIcon!;
      pais = weather.country!;
      humedad = weather.humidity!.toInt();

      jsonTags = jsonEncode(weather);

      Data.fromMap(jsonDecode(jsonTags));

     
    });
  }
}
