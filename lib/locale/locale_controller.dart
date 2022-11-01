import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesController extends GetxController {
  List<String> languagesList = ['Arabic'.tr, 'Kurdish'.tr];
  String selectedLanguage = 'Arabic'.tr;
  Locale initialLanguage = localStorage!.getString('lang') == 'fa'
      ? const Locale('fa')
      : const Locale('ar');
  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    localStorage!.setString('lang', languageCode);
    Get.updateLocale(locale);
  }
}
