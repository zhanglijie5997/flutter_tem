import 'package:app_3/middleware/authServiceMiddleware.dart';
import 'package:app_3/views/home/home.dart';
import 'package:app_3/views/login/login.dart';
import 'package:app_3/views/me/me.dart';
import 'package:get/route_manager.dart';

class Routes {
  static String get home => "/home";
  static String get login => "/login";
  static String get me => "/me";
}

final List<GetPage> routes = [
  GetPage(
      name: Routes.home,
      page: () => const Home(),
      middlewares: const []),
  GetPage(
      name: Routes.login,
      page: () => const Login(),
      middlewares: const []),
  GetPage(
      name: Routes.me,
      page: () => const Me(),
      middlewares: [AuthorMiddlewares()]),
];
