import 'package:flutter/material.dart';

class DoctorDetailsInfo extends StatelessWidget {
  const DoctorDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات الطبيب'),
      ),
      body: const Center(
        child: Text('بعدين راح ضيف 😂'),
      ),
    );
  }
}
