import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weathertest/service/location.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String key = "f3a6f2a2ee5dffc5949de6573c73f232";
  late WeatherFactory ws;
  List<Weather> _data = [];

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
      body:  Center(
        child: Column(
          children: [

            ElevatedButton(onPressed: queryWeather, child:const Text('press')),
            Text(_data.toString()),
          ],
        ),
      ),
    );
  }
  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
       Location location = Location();
    await location.getCurrentLocation();

    

    Weather weather = await ws.currentWeatherByLocation(location.latitude, location.longitude);

  

    setState(() {
      _data = [weather];
    
    });
  }
}
