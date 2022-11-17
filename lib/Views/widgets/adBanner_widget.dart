import 'package:doctors_guide/Controllers/google_ads_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatelessWidget {
  AdBanner({super.key});

  final googleAd = Get.put(googleAdsController());

  @override
  Widget build(BuildContext context) {
    if (googleAd.isAdReady) {
      return Container(
        alignment: Alignment.center,
        width: googleAd.adSize.width.toDouble(),
        height: googleAd.adSize.height.toDouble(),
        child: AdWidget(ad: googleAd.bannerAd),
      );
    }
    return Container(
      color: Colors.red,
      height: 50,
    );
  }
}
