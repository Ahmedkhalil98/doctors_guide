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
      body: Column(
        children: const [
          Text('''
              وياي تطبيق اطباء العراق يمكنك الوصول
              الى الاطباء ب اسهل طريقه و من اي مكان
              تطبيق يحتوي على اغلب دكاترة في العراق 
              مجموعه من المعلومات عن الدكاترة 
              ك اسم, تخصص, سعر الكشف, عنوان الكامل,
               موقع على الخريطة, اوقات و ايام الدوام  
                        '''),
          Text(
            'المطورين',
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(
              'سامان دخيل ',
            ),
            subtitle: Text('مطور Flutter '),
            trailing: Text('07827509472'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(
              'احمد خليل',
            ),
            subtitle: Text('مطور Flutter '),
            trailing: Text('07824828348'),
          ),
        ],
      ),
    );
  }
}
