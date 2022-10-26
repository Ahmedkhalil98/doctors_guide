import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حول التطبيق',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'اسم التطبيق',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              RichText(
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: ' وياه تطبيق اسم التطبيق يمكنك الوصول',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' الى الاطباء ب اسهل طريقه و من اي مكان',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' تطبيق يحتوي على اغلب دكاترة في العراق ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' مجموعه من المعلومات عن الدكاترة ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' ك اسم, تخصص, سعر الكشف, عنوان الكامل,',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' موقع على الخريطة, اوقات و ايام الدوام ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Text(
                'المطورين',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ListTile(
                title: Text(
                  'سامان دخيل ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('07827509472',
                    style: TextStyle(
                      color: kGrayColor,
                      fontSize: 12.sp,
                    )),
              ),
              ListTile(
                title: Text(
                  'احمد خليل',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('07824828348',
                    style: TextStyle(
                      color: kGrayColor,
                      fontSize: 12.sp,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
