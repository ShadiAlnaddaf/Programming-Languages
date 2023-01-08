import 'dart:async';
import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      if(CacheHelper.getString('token')!=null){
        Get.offAllNamed("App");
      }
      else {
        Get.offAllNamed("Login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: defaultDecoration(),
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(40),
          child: Image.asset('assets/images/splash.png'),
        )),
      ),
    );
  }
}
