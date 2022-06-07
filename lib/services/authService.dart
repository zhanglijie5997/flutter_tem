import 'package:app_3/language/language.dart';
import 'package:app_3/theme/theme.dart';
import 'package:get/get.dart';


class GlobalServicesStruct {
    final GetxController controller;
    final bool fenix;
    GlobalServicesStruct(this.controller, this.fenix);
}

// 全局service, 后续需要添加即可
class GlobalServices {
  static initService() async{
    Get.lazyPut(() => LanguageController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
  }
}

class AuthService extends GetxService{
  static AuthService get to => Get.find();
  bool isLoggedInValue = false;
  void change() {
    isLoggedInValue = true;
  }
}
