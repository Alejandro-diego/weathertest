import 'dart:core';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  ContainerWidget(
      {Key? key,
      required this.onPressed,
      required this.description,
      required this.icon,
      required this.pais,
      required this.location,
      required this.temp,
      required this.humedad})
      : super(key: key);
  final String location;
  final double temp;
  final int humedad;
  final String pais;
  final String description;
  final String icon;
  dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.red),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
            height: 220,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 165, 25, 16)),
                  child: Text(" LOCATION : $location, $pais"),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 148, 231, 15)),
                  child: Text(
                    " TEMP : ${double.parse((temp).toStringAsFixed(2))} °",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 15, 83, 231)),
                  child: Text(
                    " HUMIDITY : $humedad %",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 15, 217, 231)),
                      child: Text(
                        " DESCRPITION: $description",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 22, 21, 21)),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://openweathermap.org/img/w/$icon.png",
                              scale: 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 50,
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const SizedBox(
                  height: 200,
                  width: 10,
                  child: Center(
                      child: Text(
                    'Refresh',
                    style: TextStyle(fontSize: 18),
                  ))),
            ),
          )
        ],
      ),
    );
  }
}
