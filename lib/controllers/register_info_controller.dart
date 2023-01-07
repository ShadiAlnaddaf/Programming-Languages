import 'dart:io';
import 'package:consulting/models/register_model/expert_register_request_model.dart';
import 'package:consulting/models/register_model/expert_register_response_model.dart';
import 'package:consulting/models/register_model/normal_register_request_model.dart';
import 'package:consulting/models/register_model/normal_registet_response_model.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:consulting/views/screens/main_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart' hide FormData;

class RegisterInfoController extends GetxController {
  Rx<List<Day>> days = Rx(<Day>[]);
  List<DropdownMenuItem<RxInt>> specialities = [
    DropdownMenuItem(
      value: RxInt(-1),
      child: const Text('Select Your Specialities'),
    ),
    DropdownMenuItem(
      value: RxInt(1),
      child: const Text('Law'),
    ),
    DropdownMenuItem(
      value: RxInt(2),
      child: const Text('Medical'),
    ),
    DropdownMenuItem(
      value: RxInt(3),
      child: const Text('Mental Health'),
    ),
    DropdownMenuItem(
      value: RxInt(4),
      child: const Text('Business'),
    ),
    DropdownMenuItem(
      value: RxInt(5),
      child: const Text('Family'),
    ),
    DropdownMenuItem(
      value: RxInt(6),
      child: const Text('Nutrition'),
    ),
  ];
  RxInt selectedSpecialities = RxInt(-1);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();
  var form3Key = GlobalKey<FormState>();
  RxString selectedImagePath = ''.obs;

  Future<void> expertRegister({
    // File? image,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirm,
    required int roleId,
    required String number,
    required String address,
    required List<Day> days,
    required List<Speciality> specialities,
  }) async {
    DioHelper.postData(
            url: 'register',
            data: ExpertRegisterRequestModel(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    password: password,
                    confirm: confirm,
                    roleId: roleId,
                    number: number,
                    address: address,
                    days: days,
                    specialities: specialities)
                .toJson())
        .then((value) {
      if (ExpertRegisterResponseModel.fromJson(value.data).data?.token !=
          null) {
        debugPrint('register successful');
        debugPrint(ExpertRegisterResponseModel.fromJson(value.data)
            .data
            ?.toJson()
            .toString());
        Get.offAll(() => const MainAppScreen());
      }
    });
  }

  Future<void> normalRegister({
    File? image,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirm,
    required int roleId,
    required String address,
    required String number,
  }) async {
    DioHelper.postData(
            url: 'register',
            data: NormalRegisterRequestModel(
                    email: email,
                    password: password,
                    confirm: confirm,
                    firstName: firstName,
                    lastName: lastName,
                    roleId: 2,
                    address: address,
                    number: number)
                .toJson())
        .then((response) {
      if (NormalRegisterResponseModel.fromJson(response.data).data?.token !=
          null) {
        debugPrint('register successful');
        debugPrint(NormalRegisterResponseModel.fromJson(response.data)
            .data
            ?.toJson()
            .toString());
        Get.offAll(() => const MainAppScreen());
      }
    });
  }

  void selectImage(ImageSource imageSource) async {
    final selectedItem = await ImagePicker().pickImage(source: imageSource);
    if (selectedItem != null) {
      selectedImagePath.value = selectedItem.path;
    } else {
      Get.snackbar('Warning', 'No Image Selected');
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

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your Address';
    }
    return null;
  }
}
