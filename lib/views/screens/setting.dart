import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          child: Text('Sign Out'),
          onPressed: (){
            CacheHelper.sharedPreferences.clear();
            Get.offAll(()=>LoginScreen());
          },
        ),
      ),
    );
  }
}
