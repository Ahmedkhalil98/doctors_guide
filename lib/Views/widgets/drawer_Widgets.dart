import 'package:doctors_guide/Views/Screens/about_app_screen.dart';
import 'package:doctors_guide/Views/Screens/doctor_editable_screen.dart';
import 'package:doctors_guide/Views/Screens/login_as_doctor.dart';
import 'package:doctors_guide/Views/widgets/drawer_card.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:doctors_guide/locale/locale_controller.dart';
import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerWidgets extends StatelessWidget {
  DrawerWidgets({Key? key}) : super(key: key);
  LanguagesController controller = Get.find();
  DoctorTheme theme = DoctorTheme();
  bool isLightModeSelected = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          localStorage!.getString('role') == 'admin'
              ? UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  accountEmail: Row(
                    children: [
                      Text(
                        " ${localStorage!.getString('doctorPhoneNumber')}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  accountName: Text(
                    " ${localStorage!.getString('doctorName')}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${localStorage!.getString('doctorImageUrl')}"),
                  ),
                )
              : Container(
                  height: 180.h,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.cover,
                      )),
                ),
          //==============================

          localStorage!.getString('role') == 'admin'
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => DoctorEditableScreen());
                  },
                  child: const DrawerCard(
                    icon: Icons.person,
                    title: 'الصفحة الشخصية',
                  ),
                )
              : GestureDetector(
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
              theme.changeDoctorTheme(true);
            },
            child: const DrawerCard(
              icon: Icons.nightlight,
              title: 'تغير الوان',
            ),
          ),
          const Divider(
            height: 2,
          ),
          SwitchListTile(
              value: isLightModeSelected,
              title: const Text('تغير الوان'),
              onChanged: (bool newvalue) {
                if (isLightModeSelected) {
                  theme.changeDoctorTheme(true);
                } else {
                  theme.changeDoctorTheme(false);
                }
              }),
          const Divider(
            height: 2,
          ),
          GestureDetector(
            onTap: () {
              controller.changeLanguage('fa');
            },
            child: const DrawerCard(
              icon: Icons.language,
              title: 'تغير اللغة',
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
