import 'package:consulting/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware{
   @override
  RouteSettings? redirect(String? route){
     if (CacheHelper.getString('token')!=null){
       return const RouteSettings(name: "App");
     }
     return null;
   }
}