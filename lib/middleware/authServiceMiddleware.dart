import 'package:app_3/router/routes/routes.dart';
import 'package:app_3/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorMiddlewares extends GetMiddleware {

  @override
  int? priority = 10;
  
  @override
  RouteSettings? redirect(String? route) {
    Get.log(route!);
    if (!AuthService.to.isLoggedInValue) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar("tishi", "login", backgroundColor: Colors.white);
      });
      return  RouteSettings(name: Routes.login);
    }
    return null;
  }
}
