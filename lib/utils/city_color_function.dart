import 'package:flutter/material.dart';

Color? cityColorFun(String city) {
  if (city == 'بغداد' || city == '') {
    return Colors.black.withOpacity(0.6);
  }
  if (city == 'ذي قار' || city == '') {
    return Colors.green.withOpacity(0.6);
  }
  if (city == 'النجف' || city == '') {
    return Colors.amber.withOpacity(0.6);
  }
  if (city == 'أربيل' || city == '') {
    return Colors.blueGrey.withOpacity(0.6);
  }
  if (city == 'نينوى' || city == '') {
    return Colors.blue.withOpacity(0.6);
  }
  if (city == 'البصرة' || city == '') {
    return Colors.brown.withOpacity(0.6);
  }
  if (city == 'القادسية' || city == '') {
    return Colors.lime.withOpacity(0.6);
  }
  if (city == 'المثنى' || city == '') {
    return Colors.grey.withOpacity(0.6);
  }
  if (city == 'ديالى' || city == '') {
    return Colors.teal.withOpacity(0.6);
  }
  if (city == 'الأنبار' || city == '') {
    return Colors.pink.withOpacity(0.6);
  }
  if (city == 'كركوك' || city == '') {
    return Colors.indigo.withOpacity(0.6);
  }
  if (city == 'حلبجة' || city == '') {
    return Colors.red.withOpacity(0.6);
  }
  if (city == 'كربلاء' || city == '') {
    return Colors.blueGrey.withOpacity(0.6);
  }
  if (city == 'بابل' || city == '') {
    return Colors.deepOrange.withOpacity(0.6);
  }
  if (city == 'السليمانية' || city == '') {
    return Colors.green.withOpacity(0.6);
  }
  if (city == 'دهوك' || city == '') {
    return Colors.yellow.withOpacity(0.6);
  }
  if (city == 'الواسط' || city == '') {
    return Colors.pink.withOpacity(0.6);
  }
  if (city == 'ميسان' || city == '') {
    return Colors.purple.withOpacity(0.6);
  }
  if (city == 'صلاح الدين' || city == '') {
    return Colors.lightBlueAccent.withOpacity(0.6);
  }
  return null;
}
