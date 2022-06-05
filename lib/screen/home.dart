import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:weathertest/model/data.dart';
import 'package:weathertest/service/location.dart';


import '../widget/container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Data> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
          child: FutureBuilder<Data>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ContainerWidget(
                  icon: snapshot.data!.icon,
                  pais: snapshot.data!.pais,
                  location: snapshot.data!.name,
                  temp: snapshot.data!.temp,
                  humedad: snapshot.data!.humedad,
                  description: snapshot.data!.description ,
                ),
           
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }

  Future<Data> fetchAlbum() async {
    Location location = Location();
    await location.getCurrentLocation();

    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&APPID=f3a6f2a2ee5dffc5949de6573c73f232&units=metric'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Data.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
