import 'package:app_thoitiet/apps/home/bootom/bottom_custom.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WheatherProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        home: BottomCustom(),
      ),
    );
  }
}
