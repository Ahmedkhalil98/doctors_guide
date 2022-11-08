import 'dart:io';

class AdsManager {
  static String get getBannerId {
     if (Platform.isAndroid) {
      return "ca-app-pub-7001842571422817/1975220867";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7001842571422817/2031061181";
    } else {
      throw UnsupportedError('Un supported Error');
    }
  }
  static String get getInterstitialId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7001842571422817/4066251488";
    } else if (Platform.isIOS) {
      return "ca-app-pub-7001842571422817/6337191603";
    } else {
      throw UnsupportedError('Un supported Error');
    }
  }
}
