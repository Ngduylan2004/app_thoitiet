const linkAssets = 'assets/wheather/';

class AssetsCustom {
  static String getLinkImg(String name) =>
      '$linkAssets${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const String apiToken = 'f1608d57b6d354e504290452bbd2768f';
}
