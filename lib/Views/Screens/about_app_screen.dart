import 'package:flutter/material.dart';

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
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                title: Text(
                  'سامان دخيل ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('مطور Flutter ',
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: Text('07827509472',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                title: Text(
                  'احمد خليل',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('مطور Flutter ',
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: Text('07824828348',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
