import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/apps/utils/const.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  // call api
  // gọi k cần phải khởi tạo dùng static
  static Future<DataWheater> callApiGetWheather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=10.7318&lon=106.5528&units=metric&appid=${MyKey.api_token}');

      // chuyển đổi data map thành đối tượng
      final data = res.data;
      DataWheater result = DataWheater.fromMap(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

// trả về 1 list các detail
  static Future<List<WheatherDetail>> callApiGetWheatherDetail() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=10.7318&lon=106.5528&units=metric&appid=${MyKey.api_token}');

      // Truy cập trường đúng trong dữ liệu trả về từ API
      List data = res.data['list'];
      List<WheatherDetail> result = List.from(
          data.map<WheatherDetail>((e) => WheatherDetail.fromMap(e)).toList());

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
