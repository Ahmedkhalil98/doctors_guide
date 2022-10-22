import 'package:doctors_guide/Views/Screens/about_app_screen.dart';
import 'package:doctors_guide/Views/Screens/doctor_editable_screen.dart';
import 'package:doctors_guide/Views/Screens/login_as_doctor.dart';
import 'package:doctors_guide/Views/widgets/drawer_card.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const DoctorEditableScreen());
            },
            child: const DrawerHeader(
              child: Text(
                'تعديل معلومات الشخصية',
              ),
            ),
          ),
          const Divider(
            height: 2,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => LogInAsADoctor());
            },
            child: const DrawerCard(
              icon: Icons.app_registration,
              title: 'تسجيل كطبيب',
            ),
          ),
          const Divider(
            height: 2,
          ),
          GestureDetector(
            onTap: () {
              DoctorTheme theme = DoctorTheme();
              theme.changeDoctorTheme();
            },
            child: const DrawerCard(
              icon: Icons.nightlight,
              title: 'تغير الوان',
            ),
          ),
          const Divider(
            height: 2,
          ),
          const DrawerCard(
            icon: Icons.call,
            title: 'تواصل معنا',
          ),
          const Divider(
            height: 2,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const AboutAppScreen(),
              );
            },
            child: const DrawerCard(icon: Icons.info, title: 'حول التطبيق'),
          ),
          const Divider(
            height: 2,
          ),
          const DrawerCard(icon: Icons.star, title: 'تقيم التطبيق'),
        ],
      ),
    );
  }
}
