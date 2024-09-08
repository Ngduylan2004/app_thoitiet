import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_thoitiet/apps/home/detail/detail_body.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            const SizedBox(width: 22),
            const Icon(CupertinoIcons.location, color: Colors.white),
            const SizedBox(width: 10),
            Selector<WheatherProvider, String?>(
              selector: (context, provider) => provider.currentWeather?.name,
              builder: (context, cityName, child) {
                return AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      cityName ?? 'Loading...',
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        actions: const [
          Icon(CupertinoIcons.search, color: Colors.white, size: 30),
          SizedBox(width: 30),
        ],
      ),
      body: context.watch<WheatherProvider>().currentWeatherDetails == null
          ? const Center(child: Text('No data'))
          : DetailBody(
              listData:
                  context.watch<WheatherProvider>().currentWeatherDetails!,
            ),
    );
  }
}
