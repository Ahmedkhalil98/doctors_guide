import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';

class LogInAsADoctor extends StatelessWidget {
  const LogInAsADoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الدخول كطبيب",
          style: titleTextStyle,
        ),
      ),
    );
  }
}
