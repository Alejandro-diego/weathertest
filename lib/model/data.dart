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
        pais: map['sys']['country'],
        temp: map['main']['temp'],
        name: map['name'],
        humedad: map['main']['humidity'],
        icon: map['weather'][0]['icon'],
        description: map['weather'][0]['description']);
  }
}
