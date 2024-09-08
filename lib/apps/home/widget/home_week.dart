import 'package:flutter/material.dart';

class DayWeek extends StatelessWidget {
  const DayWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Wed 16',
          style: TextStyle(color: Colors.white),
        ),
        Image.asset(
          'assets/wheather/clear.png',
          width: 40,
          height: 40,
        ), // Đảm bảo có định nghĩa cho Icon_new
        const Text(
          '22°C',
          style: TextStyle(color: Colors.white),
        ),
        const Text(
          '15km/h',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class HomeWeek extends StatelessWidget {
  const HomeWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 350,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Màu nền trong suốt

              borderRadius: BorderRadius.circular(10), // Bo góc cho hộp
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),

                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // Đổ bóng dưới
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DayWeek(),
                DayWeek(),
                DayWeek(),
                DayWeek(),
              ],
            )),
      ],
    );
  }
}
