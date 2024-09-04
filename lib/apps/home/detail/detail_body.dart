import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/apps/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBody extends StatelessWidget {
  final List<WheatherDetail> listData;

  const DetailBody({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now(); // Thời gian hiện tại
    final filteredListData = listData.where((weatherDetail) {
      final dateTime = DateTime.parse(weatherDetail.dtTxt);
      return dateTime.isAfter(now);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final weatherDetail = filteredListData[index];
          final temp = weatherDetail.main.temp.toStringAsFixed(1);
          final description = weatherDetail.dataWheater.weather;
          final dateTimeString = weatherDetail.dtTxt;

          final dateTime = DateTime.parse(dateTimeString);

          final date = DateFormat('EEEE').format(dateTime);
          final time =
              DateFormat('HH:mm').format(dateTime); // Thời gian từ dữ liệu

          final currentTime =
              DateFormat('HH:mm').format(now); // Thời gian hiện tại
          print('Current Time: $currentTime');
          print('Weather Time: $time');

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$temp°C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            description.capitalize(),
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 13),
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        children: [
                          Text(
                            date,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        children: [
                          Text(
                            time,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width / 4,
                    child: Image.asset(
                      AssetsCustom.getLinkImg(weatherDetail.dataWheater
                          .weather), // Đảm bảo đường dẫn hình ảnh đúng
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 20),
        itemCount: filteredListData.length,
      ),
    );
  }
}

extension StringCapitalize on String {
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
