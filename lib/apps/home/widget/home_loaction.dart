import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLoaction extends StatelessWidget {
  final String cityName;

  const HomeLoaction({required this.cityName, super.key});

  @override
  Widget build(BuildContext context) {
    final fm = DateFormat('dd-MM-yyyy');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/location.png'),
            const SizedBox(width: 10),
            Text(
              cityName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          fm.format(DateTime.now()),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
