import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/network/dio_exception.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:consulting/views/screens/main_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginController extends GetxController {
  RxBool passwordVisibility = true.obs;
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void setPasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '10'.tr;
    } else if (value.length < 8 || value.length > 20) {
      return '7'.tr;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '6'.tr;
    }
    return null;
  }

  void login(String email, String password) {
    DioHelper.postData(
      url: '/login',
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      print('token when login: ${value.data['data']['token']}');
      if (value.data['data']['token'] != null) {
        CacheHelper.setString('token', value.data['data']['token']);
        Get.offAll(() => const MainAppScreen());
      }
    }).catchError((e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (errorMessage.contains('Bad')) {
        Get.snackbar(errorMessage, '8'.tr);
      } else {
        Get.snackbar(errorMessage, '9'.tr);
      }
    });
  }
}
