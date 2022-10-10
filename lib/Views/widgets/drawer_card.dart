import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final Icon icon;
  final String title;
  const DrawerCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: kPrimaryColor,
        leading: icon,
        title: Text(title),
      ),
    );
  }
}
