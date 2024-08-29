import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/repositories/api_repositories.dart';
import 'package:flutter/material.dart';

class WheatherProvider extends ChangeNotifier {
  // quản lí biến giá trị đổ ra bên ngoài
  Future<DataWheater> getWheatherCurrent() async {
    DataWheater result = await ApiRepository.callApiGetWheather();
    return result;
  }

  Future<List<WheatherDetail>> getWheatherCurrentDetail() async {
    try {
      final result = await ApiRepository.callApiGetWheatherDetail();
      print(result); // Kiểm tra dữ liệu
      return result;
    } catch (e) {
      print(e); // In lỗi nếu có
      return [];
    }
  }
}
