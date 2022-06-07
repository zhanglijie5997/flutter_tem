import 'package:get_storage/get_storage.dart';

class StorageEnum {
  static String get theme => "theme";
  static String get language => "language";
}

class Storage {
  static GetStorage get to => GetStorage();

  static init() {
    return GetStorage.init();
  }
}
