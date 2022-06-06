class Data {
  late String description;
  late String icon;
  late String pais;
  late double temp;
  late String name;
  late int humedad;
  Data(
      {required this.temp,
      required this.description,
      required this.icon,
      required this.name,
      required this.humedad,
      required this.pais});

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        pais: map['sys']['country'] ?? "n/d",
        temp: map['main']['temp']?? 1.1,
        name: map['name']?? "n/d",
        humedad: map['main']['humidity'] ??0,
        icon: map['weather'][0]['icon']?? "n/d",
        description: map['weather'][0]['description']?? "n/d");
  }
}
