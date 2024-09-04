import 'package:app_thoitiet/apps/my_app.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Position positionCurrent = await _determinePosition();
  print(positionCurrent);

  runApp(MyApp(
    positionCurrent: positionCurrent,
  ));
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
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
