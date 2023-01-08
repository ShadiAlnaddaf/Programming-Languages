import 'package:consulting/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
/*
  Locale? intialLang =
*/

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    sharedPreferences!.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
