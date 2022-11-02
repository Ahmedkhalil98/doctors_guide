import 'package:doctors_guide/Views/Screens/about_app_screen.dart';
import 'package:doctors_guide/Views/Screens/contact_with_us.dart';
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
  //DoctorTheme theme = DoctorTheme();

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
                  child: DrawerCard(
                    icon: Icons.app_registration,
                    title: 'Register as a doctor'.tr,
                  ),
                ),
          const Divider(
            height: 2,
          ),

          GetBuilder<DoctorTheme>(
            init: DoctorTheme(),
            builder: (controller) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: SwitchListTile(
                    activeColor: kPrimaryColor,
                    value: controller.isLightModeSelected,
                    title: Text(
                      'color change'.tr,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    onChanged: (bool value) {
                      controller.onChangeSwitch(value);
                    }),
                leading: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: const Icon(Icons.color_lens),
                ),
              );
            },
          ),
          const Divider(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: DrawerCard(
                  icon: Icons.language,
                  title: 'change the language'.tr,
                ),
              ),
              Flexible(
                flex: 2,
                child: DropdownButton<String>(
                  value: controller.selectedLanguage,
                  items: controller.languagesList
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ))
                      .toList(),
                  onChanged: (item) {
                    controller.selectedLanguage = item!;
                    if (controller.selectedLanguage == 'عربي') {
                      controller.changeLanguage('ar');
                    } else {
                      controller.changeLanguage('fa');
                    }
                  },
                ),
              ),
            ],
          ),
          const Divider(
            height: 2,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const ContactWithUs());
            },
            child: DrawerCard(
              icon: Icons.call,
              title: 'Connect with us'.tr,
            ),
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
