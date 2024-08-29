import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_thoitiet/apps/home/detail/detail_body.dart';
import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1d6cf3),
            Color(0xff19D2FE),
          ],
        ),
      ),
      child: FutureBuilder<List<WheatherDetail>>(
        future: context.read<WheatherProvider>().getWheatherCurrentDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return Container(
              child: const Text('No data'),
            );
          }

          List<WheatherDetail> listData = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  const SizedBox(width: 22),
                  const Icon(CupertinoIcons.location, color: Colors.white),
                  const SizedBox(width: 10),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'HO CHI MINH CITY',
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [
                Icon(CupertinoIcons.search, color: Colors.white, size: 30),
                SizedBox(width: 30),
              ],
            ),
            body: DetailBody(
              listData: listData,
            ),
          );
        },
      ),
    );
  }
}
