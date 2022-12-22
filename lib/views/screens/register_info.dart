import 'package:consulting/controllers/register_controller.dart';
import 'package:consulting/controllers/register_info_controller.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../shared/default_colors.dart';
import '../../shared/default_text_form_field.dart';

class ContinueSignUpScreen extends StatelessWidget {
  ContinueSignUpScreen({Key? key}) : super(key: key);
  final RegisterInfoController registerInfoController = Get.find();
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: defaultDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: DefaultColors.c4,
                      backgroundImage: registerInfoController
                                  .selectedImagePath.value !=
                              ''
                          ? FileImage(File(
                              registerInfoController.selectedImagePath.value))
                          : null,
                      radius: 75,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: RawMaterialButton(
                          onPressed: () {
                            registerInfoController
                                .selectImage(ImageSource.gallery);
                          },
                          elevation: 2.0,
                          shape: const CircleBorder(),
                          child:
                              registerInfoController.selectedImagePath.value !=
                                      ""
                                  ? null
                                  : const Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 80,
                                      color: DefaultColors.c5,
                                    ),
                        ),
                      ),
                    ),
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: registerInfoController.form2Key,
                  child: Column(
                    children: [
                      DefaultTextFormField(
                        hintText: 'Phone Number',
                        controller:
                            registerInfoController.phoneNumberController,
                        keyboardType: TextInputType.number,
                        validator: registerInfoController.phoneNumberValidator,
                      ),
                      if (registerInfoController.isExpert)
                        const SizedBox(
                          height: 10,
                        ),
                      if (registerInfoController.isExpert)
                        DefaultTextFormField(
                          hintText: 'Details about you',
                          controller: registerInfoController.detailsController,
                          keyboardType: TextInputType.text,
                          validator: registerInfoController.detailsValidator,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
