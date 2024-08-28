import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  final int humidity;
  final double wind, feelsLike;
  const HomeTemperature(
      {super.key,
      required this.feelsLike,
      required this.humidity,
      required this.wind});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/humidity (1).png'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'HUMIDITY',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              '$humidity%',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/icon/Vector (1).png'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'WIND',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              '${wind.toStringAsFixed(2)} km/h',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/wheather/fog.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'FEELS_LIKE',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              '$feelsLike °C',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
