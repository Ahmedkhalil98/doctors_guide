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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اسم التطبيق',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              RichText(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: ' وياه تطبيق اسم التطبيق يمكنك الوصول',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' الى اكبر عدد من الاطباء ب اسهل طريقه و من اي مكان',
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
                      text: ' ك اسم, تخصص, سعر الكشف\n,',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' عنوان الكامل,',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: ' موقع على الخريطة, \nاوقات و ايام الدوام ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                softWrap: true,
                text: TextSpan(
                  text: 'لل اطباء\n',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'يمكنك ظغط على تسجيل ك طبيب \n',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "و تقوم ب انشاء صفحة خاصة بيك ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "و توفير معلوماتك لل مراجعين ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text:
                          "هذا يساعدنا ل وصول معلوماتك لل مراجعين ب اسهل طريقه ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
