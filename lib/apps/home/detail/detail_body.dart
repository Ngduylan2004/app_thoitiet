import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/apps/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Thêm import này

class DetailBody extends StatelessWidget {
  final List<WheatherDetail> listData;

  const DetailBody({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          // Lấy thông tin từ listData
          final weatherDetail = listData[index];
          final temp = weatherDetail.main.temp
              .toStringAsFixed(1); // Chuyển đổi double thành String
          final description = weatherDetail.dataWheater.weather;
          final dateTime = weatherDetail.dtTxt;

          // Tách ngày và giờ
          final date =
              DateFormat('EEEE').format(DateTime.parse(dateTime)); // Lấy thứ
          final time = dateTime.split(' ')[1];

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
                            '$temp°C', // Hiển thị nhiệt độ
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            description
                                .capitalize(), // Hiển thị mô tả thời tiết
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 13),
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        children: [
                          Text(
                            date, // Hiển thị thứ
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
                            time, // Hiển thị giờ
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
                      AssetsCustom.getLinkImg(weatherDetail
                          .dataWheater.weather) // hoặc thuộc tính khác nếu cần
                      , // Đảm bảo đường dẫn hình ảnh đúng
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 20),
        itemCount: listData.length, // Sử dụng số lượng phần tử thực tế
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
