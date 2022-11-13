import 'dart:io';

import 'package:doctors_guide/Controllers/ads_controller.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWithUs extends StatelessWidget {
  ContactWithUs({super.key});

  openTelegram({
    required BuildContext context,
    required String userName,
  }) async {
    // var telegram = '+964$userName';
    // String telegram = userName;
    String telegragURlAndroid = "https://telegram.me/$userName";
    String telegramURLIos = "https://telegram.me/$userName";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(telegramURLIos))) {
        await launchUrl(
          Uri.parse(telegramURLIos),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Telegram not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(telegragURlAndroid))) {
        await launchUrl(Uri.parse(telegragURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Telegram not installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final adsController = Get.put(DoctorAdsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تواصل معنا',
        ),
      ),
      bottomNavigationBar: adsController.isBannerReady
          ? GetBuilder<DoctorAdsController>(
              builder: ((controller) {
                return controller.bannerWidget();
              }),
            )
          : Container(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Image.asset("images/applogo.png")),
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  textAlign: TextAlign.center,
                  'اذا واجهتك اي مشكلة او خطأ في التطبيق فكن مشاركا معا لاصلاحها وتقديم افضل خدمة لشعبنا .',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'يمكنك تواصل معنا من خلال :',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            //ToDo : connect with Tw
                          },
                          icon: Icon(
                            Icons.telegram,
                            size: 35.h,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            //ToDo : connect with Tw
                          },
                          icon: Icon(
                            Icons.whatsapp,
                            size: 35.h,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            //ToDo : connect with Tw
                          },
                          icon: Icon(
                            Icons.facebook,
                            size: 35.h,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            void _launchURL() async {
                              // final Uri params = Uri(
                              //   scheme: 'mailto',
                              //   path: 'my.mail@example.com',
                              // );
                              // String url = params.toString();
                              Uri url = Uri.parse(
                                  'mailto:smith@example.org?subject=News&body=New%20plugin');

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                print('Could not launch $url');
                              }
                            }
                          },
                          icon: Icon(
                            Icons.email,
                            size: 35.h,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
