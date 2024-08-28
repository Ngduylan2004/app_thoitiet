import 'package:app_thoitiet/apps/utils/const.dart';
import 'package:flutter/material.dart';

class HomeWheatherIcon extends StatelessWidget {
  final String nameIcon;

  const HomeWheatherIcon({super.key, required this.nameIcon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      // khắc phụ kích thước cố định
      width: size.width / 1.5,
      padding: const EdgeInsets.all(40),
      child: Image.asset(
        // truyền ảnh
        AssetsCustom.getLinkImg(nameIcon),
        // bọc icon vừa đủ k bì tràn ra ngoài
        fit: BoxFit.cover,
      ),
      //
    );
  }
}
