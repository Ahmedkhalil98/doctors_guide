import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';

class DoctorInfoCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String? trailing;
  DoctorInfoCard({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
        ),
      ),
    );
  }
}
