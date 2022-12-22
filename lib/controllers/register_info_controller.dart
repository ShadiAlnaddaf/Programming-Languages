import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterInfoController extends GetxController {
  late bool isExpert;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();
  var selectedImagePath = "".obs;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
    } on PlatformException catch (e) {
      return ('Failed to pick image: $e');
    }
    ImageProvider setImage() {
      return FileImage(File(image!.path));
    }
  }

  void selectImage(ImageSource imageSource) async {
    final selectedItem = await ImagePicker().pickImage(source: imageSource);
    if (selectedItem != null) {
      selectedImagePath.value = selectedItem.path;
    } else {
      print('No Image Selected');
    }
  }

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your first name!';
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your Last Name!';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your phone number!';
    }
    return null;
  }

  String? detailsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your Details!';
    }
    return null;
  }
}
