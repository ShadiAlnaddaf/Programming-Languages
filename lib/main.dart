import 'package:consulting/controllers/register_info_controller.dart';
import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:consulting/views/screens/login.dart';
import 'package:consulting/views/screens/main_app.dart';
import 'package:consulting/views/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedPreferences;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainAppScreen(),
      getPages: [
        GetPage(name: '/', page: ()=>LoginScreen()),
      ],
    );
  }
}
