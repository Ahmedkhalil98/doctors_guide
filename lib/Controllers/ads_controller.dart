import 'package:doctors_guide/Controllers/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DoctorAdsController extends GetxController {
  late BannerAd bannerAd;
  bool isBannerReady = false;
  late InterstitialAd interstitialAd;
  bool isInterstitialready = false;

  @override
  void onInit() {
    super.onInit();
    initAds();
    initBanner();
    initInterstitial();
    update();
  }

  Future<InitializationStatus> initAds() {
    return MobileAds.instance.initialize();
  }

  void initInterstitial() {
    InterstitialAd.load(
      adUnitId: AdsManager.getInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          isInterstitialready = true;
          update();
        },
        onAdFailedToLoad: (LoadAdError error) {
          isInterstitialready = false;
          update();
        },
      ),
    );
  }

  void initBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdsManager.getBannerId,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        isBannerReady = true;
        update();
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        isBannerReady = false;
        update();
      }),
    );
    bannerAd.load();
  }

  Widget bannerWidget() {
    if (isBannerReady) {
      return Container(
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        margin: const EdgeInsets.all(10.0),
        child: AdWidget(ad: bannerAd),
      );
    } else {
      return Container();
    }
  }
}
