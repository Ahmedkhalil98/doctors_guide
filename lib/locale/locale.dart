import 'package:get/get.dart';

class DoctorLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {"home-page-title": "قائمة الاطباء"},
        "fa": {"home-page-title": "ليسته نوزداره"},
      };
}
