import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late bool isExpert;
  RxBool passwordVisibility = true.obs;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '17'.tr;
    } else if (passwordController.text != value) {
      return '16'.tr;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '6'.tr;
    }
    return null;
  }
}
