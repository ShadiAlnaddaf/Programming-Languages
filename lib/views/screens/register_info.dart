import 'package:consulting/controllers/register_controller.dart';
import 'package:consulting/controllers/register_info_controller.dart';
import 'package:consulting/models/register_model/expert_register_request_model.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:consulting/shared/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../shared/default_colors.dart';
import '../../shared/default_material_button.dart';
import '../../shared/default_text_form_field.dart';

class ContinueSignUpScreen extends StatelessWidget {
  ContinueSignUpScreen({Key? key}) : super(key: key);
  final RegisterInfoController registerInfoController =
      Get.put(RegisterInfoController());
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: defaultDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => CircleAvatar(
                          backgroundColor: DefaultColors.c4,
                          backgroundImage:
                              registerInfoController.selectedImagePath.value !=
                                      ''
                                  ? FileImage(File(registerInfoController
                                      .selectedImagePath.value))
                                  : null,
                          radius: 75,
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: RawMaterialButton(
                              onLongPress: () {
                                registerInfoController.selectedImagePath.value =
                                    '';
                              },
                              onPressed: () {
                                registerInfoController
                                    .selectImage(ImageSource.gallery);
                              },
                              elevation: 2.0,
                              shape: const CircleBorder(),
                              child: registerInfoController
                                          .selectedImagePath.value !=
                                      ""
                                  ? null
                                  : const Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 80,
                                      color: DefaultColors.c5,
                                    ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Form(
                      key: registerInfoController.form1Key,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: 200,
                            child: DefaultTextFormField(
                              hintText: 'First Name',
                              controller:
                                  registerInfoController.firstNameController,
                              keyboardType: TextInputType.name,
                              prefixIcon: Icons.perm_identity,
                              validator:
                                  registerInfoController.firstNameValidator,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: DefaultTextFormField(
                              hintText: 'Last Name',
                              controller:
                                  registerInfoController.lastNameController,
                              keyboardType: TextInputType.name,
                              prefixIcon: Icons.perm_identity,
                              validator:
                                  registerInfoController.lastNameValidator,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: registerInfoController.form3Key,
                  child: DefaultTextFormField(
                    hintText: 'Phone Number',
                    controller: registerInfoController.phoneNumberController,
                    keyboardType: TextInputType.number,
                    validator: registerInfoController.phoneNumberValidator,
                    prefixIcon: Icons.phone_android,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (registerController.isExpert)
                  Expanded(
                    child: Form(
                      key: registerInfoController.form2Key,
                      child: SingleChildScrollView(
                        // physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => DropdownButtonFormField<RxInt>(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.value == -1) {
                                      return "Select Your Speciality";
                                    }
                                    return null;
                                  },
                                  items: registerInfoController.specialities,
                                  onChanged: (value) => registerInfoController
                                      .selectedSpecialities
                                      .value = value!.value,
                                  value: registerInfoController
                                      .selectedSpecialities),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormField(
                              hintText: 'Details about you',
                              controller:
                                  registerInfoController.detailsController,
                              keyboardType: TextInputType.text,
                              validator:
                                  registerInfoController.detailsValidator,
                              prefixIcon: Icons.info_outline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTextFormField(
                              hintText: 'Address',
                              controller:
                                  registerInfoController.addressController,
                              keyboardType: TextInputType.text,
                              validator:
                                  registerInfoController.addressValidator,
                              prefixIcon: Icons.location_on_outlined,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomDateSelector(onChanged: (val) {
                                registerInfoController.days = val;
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                DefaultMaterialButton(
                  onPressed: () {
                    print(registerInfoController.days.toString());
                    if (registerController.isExpert &&
                        registerInfoController.days.value.isEmpty) {
                      Get.defaultDialog(
                          title: "Wrong",
                          middleText:
                              "You can't Sign Up Without Select any available Day",
                          onConfirm: () {
                            Get.back();
                          });
                    } else if (registerController.isExpert &&
                        registerInfoController.days.value.isNotEmpty &&
                        (registerInfoController.form1Key.currentState!
                                .validate() ||
                            registerInfoController.form3Key.currentState!
                                .validate() ||
                            registerInfoController.form2Key.currentState!
                                .validate())) {
                      print('expert');
                      registerInfoController.expertRegister(
                          firstName:
                              registerInfoController.firstNameController.text,
                          lastName:
                              registerInfoController.lastNameController.text,
                          email: registerController.emailController.text,
                          password: registerController.passwordController.text,
                          confirm:
                              registerController.confirmPasswordController.text,
                          roleId: 1,
                          number:
                              registerInfoController.phoneNumberController.text,
                          address:
                              registerInfoController.addressController.text,
                          days: registerInfoController.days.value,
                          specialities: <Speciality>[
                            Speciality(
                                specialityId: registerInfoController
                                    .selectedSpecialities.value,
                                details: registerInfoController
                                    .detailsController.text)
                          ]);
                    }
                    if ((registerController.isExpert == false) &&
                            registerInfoController.form1Key.currentState!
                                .validate() ||
                        registerInfoController.form3Key.currentState!
                            .validate()) {
                      print('normal');
                    }
                  },

                  label: 'Sign Up',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
