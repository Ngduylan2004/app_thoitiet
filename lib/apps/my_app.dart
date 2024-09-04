import 'package:app_thoitiet/apps/home/bootom/bottom_custom.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final Position positionCurrent;
  const MyApp({super.key, required this.positionCurrent});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WheatherProvider()..updatePositon(positionCurrent),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        home: BottomCustom(),
      ),
    );
  }
}
