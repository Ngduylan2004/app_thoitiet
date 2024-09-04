class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all': all,
    };
  }
}

class DataWheater {
  final String weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final String name;
  final int cod;

  DataWheater({
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.name,
    required this.cod,
  });

  factory DataWheater.fromMap(Map<String, dynamic> map) {
    return DataWheater(
      weather: map['weather']?[0]['description'] ??
          'Unknown', // Cung cấp giá trị mặc định
      base: map['base'] ?? 'Unknown', // Cung cấp giá trị mặc định
      main: Main.fromMap(map['main']),
      visibility: map['visibility'] ?? 0, // Cung cấp giá trị mặc định
      wind: Wind.fromMap(map['wind']),
      clouds: Clouds.fromMap(map['clouds']),
      name: map['name'] ?? 'Unknown', // Cung cấp giá trị mặc định
      cod: map['cod'] ?? 0, // Cung cấp giá trị mặc định
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': weather,
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'name': name,
      'cod': cod,
    };
  }
}

class Main {
  final double temp;
  final int pressure;
  final int humidity;
  final double feelsLike;

  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] as num).toDouble(),
      pressure: map['pressure'],
      humidity: map['humidity'],
      feelsLike: (map['feels_like'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'feels_like': feelsLike,
    };
  }
}

class WheatherDetail {
  Main main;
  DataWheater dataWheater;
  String dtTxt;

  WheatherDetail({
    required this.main,
    required this.dataWheater,
    required this.dtTxt,
  });

  // Phương thức fromMap để tạo đối tượng từ Map
  factory WheatherDetail.fromMap(Map<String, dynamic> map) {
    return WheatherDetail(
      main: Main.fromMap(map['main']),
      dataWheater: DataWheater.fromMap(map),
      dtTxt: map['dt_txt'],
    );
  }

  // Phương thức toMap để chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'main': main.toMap(),
      'dataWheater': dataWheater.toMap(),
      'dt_txt': dtTxt,
    };
  }
}

class Wind {
  final double speed;
  final int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] as num).toDouble(),
      deg: map['deg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }
}
