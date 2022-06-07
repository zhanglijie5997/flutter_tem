import 'package:app_3/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// 亮色
class LightTheme {
  static ThemeData get to => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(246, 247, 251, 1),
            elevation: 0,
            shadowColor: null,
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 24)),
        shadowColor: null,
        scaffoldBackgroundColor: const Color.fromRGBO(246, 247, 251, 1),
        primaryColor:  Colors.red
      );
}

// 黑色
class DarkTheme {
  static ThemeData get to => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(20, 23, 24, 1),
            elevation: 0,
            shadowColor: null,
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
        shadowColor: null,
        scaffoldBackgroundColor: const Color.fromRGBO(20, 23, 24, 1),
        primaryColor: const Color.fromRGBO(20, 23, 24, 1),
      );
}

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();
  bool _isDark = Storage.to.read("theme") ?? false;
  get isDark => _isDark;
  /// 修改主题
  /// * [value] bool true -> light  fasle -> dark
  void changeMode(value) {
    _isDark = value;
    Storage.to.write("theme", _isDark);
    // 修改状态栏
    SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
    );

    if (value) {
      uiStyle = SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      );
    }
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

extension ExTheme on ThemeController{
}
