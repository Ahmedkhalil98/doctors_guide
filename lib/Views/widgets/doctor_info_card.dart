import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoCard extends StatelessWidget {
  final String title;
  final String titleVale;

  const DoctorInfoCard({
    Key? key,
    required this.titleVale,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      color: kPrimaryColor,
      child: ListTile(
        leading: Text("$title :",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        title: Text(
          titleVale,
        ),
      ),
    );
  }
}
