import 'package:doctors_guide/Controllers/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DoctorAdsController extends GetxController {
  BannerAd? bannerAd;
  bool isBannerReady = false;

  InterstitialAd? interstitialAd;
  bool isInterstitialready = false;

  @override
  void onInit() {
    initBanner();
    loadInterstitialAd();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdsManager.getInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          interstitialAd = ad;
        },
        onAdFailedToLoad: (err) {
          print(
              '++++++++++++++++++++++++ Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  void initBanner() {
    BannerAd(
      adUnitId: AdsManager.getBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          print(
              '====================Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  Widget bannerWidget() {
    return SizedBox(
      width: bannerAd!.size.width.toDouble(),
      height: bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: bannerAd!),
    );
  }
}
