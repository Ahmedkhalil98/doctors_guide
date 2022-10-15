import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
        ),
      ),
    );
  }
}
