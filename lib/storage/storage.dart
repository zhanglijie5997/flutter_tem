import 'package:get_storage/get_storage.dart';

class Storage {
  static GetStorage get to => GetStorage("storage");

  static init() {
    return GetStorage.init();
  }
}
