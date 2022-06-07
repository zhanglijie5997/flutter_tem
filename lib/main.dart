import 'package:app_3/language/language.dart';
import 'package:app_3/router/routes/routes.dart';
import 'package:app_3/services/authService.dart';
import 'package:app_3/storage/storage.dart';
import 'package:app_3/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  await GlobalServices.initService();
  runApp(const MyApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final GlobalKey global = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (state) {
        return GetMaterialApp(
            key: global,
            themeMode: state .isDark? ThemeMode.light : ThemeMode.dark,
            title: 'Flutter Demo',
            opaqueRoute: true,
            getPages: routes,
            initialRoute: Routes.home,
            localizationsDelegates: const [
            // AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            translations: Messages(),
            supportedLocales: const [
              Locale('en', 'US'), // English, no country code
              Locale('es', ''), // Spanish, no country code
              Locale('zh', 'CN'), // Chinese, no country code
            ],
            fallbackLocale: LanguageController.to.local,
            navigatorObservers: [routeObserver],
            initialBinding: BindingsBuilder(() => [
              Get.put(AuthService()),
            ]),
            locale: LanguageController.to.local, // Chinese, no country code,
            theme: !state.isDark ? LightTheme.to : DarkTheme.to,
        );
      }
    );
  }
}
