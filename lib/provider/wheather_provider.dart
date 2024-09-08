import 'package:app_thoitiet/apps/model/data_wheather.dart';
import 'package:app_thoitiet/repositories/api_repositories.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class WheatherProvider extends ChangeNotifier {
  Position? position;
  bool isLoading = true;
  String? cityName;
  String? error;
  DataWheater? _currentWeather;
  List<WheatherDetail>? _currentWeatherDetails;

  DataWheater? get currentWeather => _currentWeather;
  List<WheatherDetail>? get currentWeatherDetails => _currentWeatherDetails;

  Future<void> getWheatherByCity() async {
    try {
      if (cityName == null || cityName!.isEmpty) {
        error = 'Tên thành phố không thể để trống';
        notifyListeners();
      } else {
        DataWheater result =
            await ApiRepository.callApiGetWheatherByCity(cityName!);
        _currentWeather = result;
        await getWheatherCurrentDetail();
        error = null;
        notifyListeners();
      }
    } catch (e) {
      error = 'Lỗi không xác định';
      notifyListeners();
    }
  }

  Future<void> getWheatherCurrent() async {
    try {
      isLoading = true;
      notifyListeners();
      DataWheater result = await ApiRepository.callApiGetWheather(position);
      _currentWeather = result;
      cityName = result.name;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = 'Loi gi do';
      notifyListeners();
    }
  }

//TODO: Check error callApiGetWheatherDetail
  Future<void> getWheatherCurrentDetail() async {
    try {
      if (cityName == null || cityName!.isEmpty) {
        return;
      }
      final result =
          await ApiRepository.callApiGetWheatherDetailByCity(cityName!);
      _currentWeatherDetails = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void start() async {
    Position positionCurrent = await _determinePosition();
    if (kDebugMode) {
      print(positionCurrent);
    }
    updatePosition(positionCurrent);
  }

  updateCityName(String value) {
    cityName = value;
    notifyListeners();
  }

  void updatePosition(Position positionCurrent) {
    position = positionCurrent;
    updateWeather();
  }

  Future<void> updateWeather() async {
    if (position != null) {
      await getWheatherCurrent();
      await getWheatherCurrentDetail();
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
