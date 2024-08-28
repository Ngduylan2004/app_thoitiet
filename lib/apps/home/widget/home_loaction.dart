import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLoaction extends StatelessWidget {
  const HomeLoaction({super.key});

  @override
  Widget build(BuildContext context) {
    // sử dụng dateformat để định dạng ngày tháng năm
    final fm = DateFormat('dd-MM-yyyy');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/location.png'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'HOCHIMINH_CITY',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ],
        ),
        Text(
          fm.format(DateTime.now()),
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
