import 'package:app_thoitiet/apps/home/detail/detail_page.dart';
import 'package:app_thoitiet/apps/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomCustom extends StatefulWidget {
  const BottomCustom({super.key});

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> {
  // này là phương thức s
  List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'list'),
  ];
  late final PageController controller;

  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // làm cho hòa quyện màu với body
      extendBody: true,

      body: PageView(
        controller: controller,
        children: const [
          HomePage(),
          DetailPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: active,
        //tắt bóng
        elevation: 0,
        onTap: (index) {
          setState(() {
            active = index;
            controller.jumpToPage(index);
          });
        },
        items: listItem,
      ),
    );
  }

  @override
  void initState() {
    controller = PageController();
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }
}
