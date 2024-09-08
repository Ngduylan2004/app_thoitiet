import 'package:app_thoitiet/apps/home/widget/home_loaction.dart';
import 'package:app_thoitiet/apps/home/widget/home_row1.dart';
import 'package:app_thoitiet/apps/home/widget/home_temperature.dart';
import 'package:app_thoitiet/apps/home/widget/home_week.dart';
import 'package:app_thoitiet/apps/home/widget/home_wheather_icon.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Body with gradient background
          Container(
            alignment: Alignment.center,
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
            child: () {
              final provider = context.watch<WheatherProvider>();
              if (provider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (provider.error != null || provider.currentWeather == null) {
                return Center(
                  child: Text(provider.error ?? 'Không có dữ liệu'),
                );
              } else {
                final data = provider.currentWeather!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                          height: 80), // Increased to make room for AppBar
                      HomeWheatherIcon(nameIcon: data.weather),
                      HomeRow1(temp: data.main.temp),
                      HomeLoaction(cityName: data.name),
                      const SizedBox(height: 30),
                      HomeTemperature(
                        wind: data.wind.speed,
                        humidity: data.main.humidity,
                        feelsLike: data.main.feelsLike,
                      ),
                      const SizedBox(height: 25),
                      const HomeWeek(),
                    ],
                  ),
                );
              }
            }(),
          ),
          // Positioned AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor:
                  Colors.blue.withOpacity(1), // Make it semi-transparent
              elevation: 0, // Remove shadow to make it blend more
              title: const Text(
                'Weather_app',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showSearchDialog();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<WheatherProvider>().start();
  }

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tìm Kiếm Theo Thành Phố'),
          content: TextField(
            onChanged: (value) {
              context.read<WheatherProvider>().updateCityName(value);
            },
            decoration: const InputDecoration(hintText: 'Nhập tên thành phố'),
          ),
          actions: [
            TextButton(
              child: const Text('Tìm kiếm'),
              onPressed: () async {
                await context.read<WheatherProvider>().getWheatherByCity();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
