import 'package:doctors_guide/Controllers/google_ads_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatelessWidget {
  AdBanner({super.key});

  final googleAd = Get.put(googleAdsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<googleAdsController>(
      init: googleAdsController(),
      builder: (controller) {
        if (controller.isAdReady) {
          return Container(
            alignment: Alignment.center,
            width: controller.adSize.width.toDouble(),
            height: controller.adSize.height.toDouble(),
            child: AdWidget(ad: controller.bannerAd),
          );
        }
        return Container(
          color: Colors.red,
          height: 50,
        );
      },
    );
  }
}
