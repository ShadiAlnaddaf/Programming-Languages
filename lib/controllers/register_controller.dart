import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

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
      return 'Enter Password';
    } else if (value.length < 8 || value.length > 20) {
      return 'Password Must be between 8 & 20 Character';
    }
    return null;
  }
  String? confirmPasswordValidator(String? value) {
   if(passwordController.text != value){
     return "Password doesn't Match";
   }
   return null;
  }
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Email';
    }
    return null;
  }
}
