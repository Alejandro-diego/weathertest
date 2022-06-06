import 'package:flutter/material.dart';

import 'package:weathertest/screen/home1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData.dark(),
      home: const Homepage(),
    );
  }
}
