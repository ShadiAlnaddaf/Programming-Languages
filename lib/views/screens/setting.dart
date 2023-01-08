import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../locale/locale_controller.dart';
import '../../shared/cache_helper.dart';
import 'login.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller1 = Get.find();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.center,
                  focal: Alignment.topLeft,
                  radius: 5.7,
                  colors: [
                    Color(0XFFCAE9FF),
                    Colors.white,
                    Colors.white,
                    Color(0XFF62B6CB)
                  ]),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1B4965),
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text('Sign Out'),
                    onPressed: () {
                      print(CacheHelper.getString('token'));

                      CacheHelper.sharedPreferences.clear();
                      print(CacheHelper.getString('token'));
                      Get.offAll(() => LoginScreen());
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text('English'),
                    onPressed: () {
                      controller1.changeLang("en");
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text('Arabic'),
                    onPressed: () {
                      controller1.changeLang("ar");
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
