import 'package:flutter/material.dart';

class HomeRow1 extends StatelessWidget {
  final double temp;

  const HomeRow1({super.key, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '${temp.round().toStringAsFixed(0)}°C', // Chuyển đổi thành chuỗi với 1 chữ số thập phân
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
