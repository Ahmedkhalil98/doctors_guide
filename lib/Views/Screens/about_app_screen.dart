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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '''
                  وياي تطبيق اطباء العراق يمكنك الوصول
                  الى الاطباء ب اسهل طريقه و من اي مكان
                  تطبيق يحتوي على اغلب دكاترة في العراق 
                  مجموعه من المعلومات عن الدكاترة 
                  ك اسم, تخصص, سعر الكشف, عنوان الكامل,
                   موقع على الخريطة, اوقات و ايام الدوام  
                            ''',
                style: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
