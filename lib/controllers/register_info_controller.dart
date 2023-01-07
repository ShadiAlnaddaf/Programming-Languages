import 'dart:io';

import 'package:consulting/models/register_model/expert_register_request_model.dart';
import 'package:consulting/models/register_model/expert_register_response_model.dart';
import 'package:consulting/models/register_model/normal_register_request_model.dart';
import 'package:consulting/models/register_model/normal_registet_response_model.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:consulting/views/screens/main_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:image_picker/image_picker.dart';

class RegisterInfoController extends GetxController {
  Rx<List<Day>> days = Rx(<Day>[]);
  List<DropdownMenuItem<RxInt>> specialities = [
    DropdownMenuItem(
      value: RxInt(-1),
      child: Text('22'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(1),
      child: Text('26'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(2),
      child: Text('27'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(3),
      child: Text('28'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(4),
      child: Text('29'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(5),
      child: Text('30'.tr),
    ),
    DropdownMenuItem(
      value: RxInt(6),
      child: Text('31'.tr),
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
      Get.snackbar('37'.tr, '38'.tr);
    }
  }

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '32'.tr;
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '33'.tr;
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '34'.tr;
    }
    return null;
  }

  String? detailsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '35'.tr;
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '36'.tr;
    }
    return null;
  }
}
