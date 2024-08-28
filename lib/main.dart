import 'package:app_thoitiet/apps/my_app.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
// class Clouds {
//   final int all;

//   Clouds({required this.all});

//   factory Clouds.fromMap(Map<String, dynamic> map) {
//     return Clouds(
//       all: map['all'],
//     );
//   }
// }

// class DataWheater {
//   final String weather;
//   final String base;
//   final Main main;
//   final int visibility;
//   final Wind wind;
//   final Clouds clouds;
//   final String name;
//   final int cod;

//   DataWheater({
//     required this.weather,
//     required this.base,
//     required this.main,
//     required this.visibility,
//     required this.wind,
//     required this.clouds,
//     required this.name,
//     required this.cod,
//   });

//   factory DataWheater.fromMap(Map<String, dynamic> map) {
//     return DataWheater(
//       weather: map['weather'][0]['description'],
//       base: map['base'],
//       main: Main.fromMap(map['main']),
//       visibility: map['visibility'],
//       wind: Wind.fromMap(map['wind']),
//       clouds: Clouds.fromMap(map['clouds']),
//       name: map['name'],
//       cod: map['cod'],
//     );
//   }
// }

// class Main {
//   final double temp;
//   final int pressure;
//   final int humidity;

//   Main({required this.temp, required this.pressure, required this.humidity});

//   factory Main.fromMap(Map<String, dynamic> map) {
//     return Main(
//       temp: map['temp'],
//       pressure: map['pressure'],
//       humidity: map['humidity'],
//     );
//   }
// }

// class Wind {
//   final double speed;
//   final int deg;

//   Wind({required this.speed, required this.deg});

//   factory Wind.fromMap(Map<String, dynamic> map) {
//     return Wind(
//       speed: map['speed'],
//       deg: map['deg'],
//     );
//   }
// }
