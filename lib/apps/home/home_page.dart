import 'package:app_thoitiet/apps/home/widget/home_loaction.dart';
import 'package:app_thoitiet/apps/home/widget/home_row1.dart';
import 'package:app_thoitiet/apps/home/widget/home_temperature.dart';
import 'package:app_thoitiet/apps/home/widget/home_week.dart';
import 'package:app_thoitiet/apps/home/widget/home_wheather_icon.dart';
import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/provider/wheather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // // extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 54, 146, 220),
      //   title: const Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'Viet Nam',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       SizedBox(
      //         width: 60,
      //       ),
      //       Icon(
      //         Icons.menu,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        alignment: Alignment.center,
        // dùng decoration
        decoration: const BoxDecoration(
          // đổ bóng
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1d6cf3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        // hứng dữ liệu
        child: FutureBuilder(
          future: context.read<WheatherProvider>().getWheatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                //trả về vòng tròn loading
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return Container(
                child: const Text('no data'),
              );
            }
            DataWheater data = snapshot.data as DataWheater;
            // print(data.weather[0].main);
            // print('Thời tiết hiện tại: ${data.weather}');
            //print('Nhiệt độ hiện tại: ${data.main.temp}°C');
            final weatherIconName = data.weather;
            // final temp1 = data.main.temp;

            return Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                HomeWheatherIcon(nameIcon: weatherIconName),
                // ch hiểu lắm
                HomeRow1(temp: data.main.temp),
                HomeLoaction(cityName: data.name),
                const SizedBox(height: 30),
                HomeTemperature(
                  wind: data.wind.speed,
                  humidity: data.main.humidity,
                  feelsLike: data.main.feelsLike,
                ),
                const SizedBox(
                  height: 25,
                ),
                const HomeWeek(),
              ],
            );
          },
        ),
      ),
    );
  }

  // hàm
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WheatherProvider>().getWheatherCurrent();
  }
}
