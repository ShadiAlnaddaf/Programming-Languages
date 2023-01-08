import 'package:consulting/locale/locale_controller.dart';
import 'package:consulting/middleware/auth_middleware.dart';
import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:consulting/views/screens/login.dart';
import 'package:consulting/views/screens/main_app.dart';
import 'package:consulting/views/screens/register.dart';
import 'package:consulting/views/screens/register_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale/locale.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: MyLocale(),
      getPages: [
        GetPage(
            name: '/',
            page: () => LoginScreen(),
            middlewares: [AuthMiddleware()]),
        GetPage(name: '/Register', page: () => SignUpScreen()),
        GetPage(name: '/RegisterInfo', page: () => ContinueSignUpScreen()),
        GetPage(name: '/App', page: () => const MainAppScreen()),
      ],
    );
  }
}
