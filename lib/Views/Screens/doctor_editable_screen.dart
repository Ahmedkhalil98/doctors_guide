import 'package:flutter/material.dart';

class DoctorEditableScreen extends StatelessWidget {
  const DoctorEditableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'معلوماتك الشخصية',
        ),
      ),
      body: const Center(
        child: Text('بعدين نتفق عليه'),
      ),
    );
  }
}
