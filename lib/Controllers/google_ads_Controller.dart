import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class googleAdsController extends GetxController {
  static const bool _testMode = true;

  static String get bannerAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return "ca-app-pub-8864584565181792/2762526644";
  }

  late BannerAd bannerAd;
  bool isAdReady = false;
  final AdSize adSize = AdSize.banner;

  void createBannerAd() {
    bannerAd = BannerAd(
      size: adSize,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: ((ad) {
          isAdReady = true;
          update();
        }),
        onAdFailedToLoad: (ad, error) {
          isAdReady = false;
          update();
          print("ads error:>>>>> $error");
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
    update();
  }

  @override
  void onInit() {
    createBannerAd();
    super.onInit();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }
}
