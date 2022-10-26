import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesController extends GetxController {
  Locale initialLanguage = localStorage!.getString('lang') == 'kur'
      ? const Locale('kur')
      : const Locale('ar');
  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    localStorage!.setString('lang', languageCode);
    Get.updateLocale(locale);
  }
}
