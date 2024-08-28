import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: AppBar(
              title: const Text('VIET NAM'),
              backgroundColor: Colors.transparent, //No more green
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
