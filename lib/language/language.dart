import 'package:app_3/language/json/en.dart';
import 'package:app_3/language/json/zh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': Zh.json,
    'en_US': En.json
  };
}
class I18n {
  static String get hello => 'hello'.tr;
  static String get capture => 'capture'.tr;
}

class LanguageController extends GetxController{
  static LanguageController get to => Get.find<LanguageController>();
  void changeLanguage(String languageCode, String  countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
