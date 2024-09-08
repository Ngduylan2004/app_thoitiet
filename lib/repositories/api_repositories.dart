import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/apps/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class ApiRepository {
  // call api
  // gọi k cần phải khởi tạo dùng static
  static Future<DataWheater> callApiGetWheather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${MyKey.apiToken}');

      // chuyển đổi data map thành đối tượng
      final data = res.data;
      DataWheater result = DataWheater.fromMap(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

// search
  static Future<DataWheater> callApiGetWheatherByCity(String cityName) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=${MyKey.apiToken}');

      final data = res.data;
      DataWheater result = DataWheater.fromMap(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // trả về 1 list các detail
  static Future<List<WheatherDetail>> callApiGetWheatherDetail(
      Position? position) async {
    try {
      if (position == null) {
        print('Position is null'); // Thêm kiểm tra vị trí
        return [];
      }
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=${MyKey.apiToken}');

      // Kiểm tra dữ liệu trả về
      print('Response data: ${res.data}');

      List data = res.data['list'];
      List<WheatherDetail> result = List.from(
          data.map<WheatherDetail>((e) => WheatherDetail.fromMap(e)).toList());

      return result;
    } catch (e) {
      print('Error in callApiGetWheatherDetail: $e'); // Thêm thông báo lỗi
      rethrow;
    }
  }

  static Future<List<WheatherDetail>> callApiGetWheatherDetailByCity(
      String cityName) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&appid=${MyKey.apiToken}');

      // Kiểm tra dữ liệu trả về
      print('Response data: ${res.data}');

      List data = res.data['list'];
      List<WheatherDetail> result = List.from(
          data.map<WheatherDetail>((e) => WheatherDetail.fromMap(e)).toList());

      return result;
    } catch (e) {
      print('Error in callApiGetWheatherDetailByCity: $e');
      throw Exception('Loi call api');
    }
  }
}
