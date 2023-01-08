import 'dart:io';

import 'package:consulting/shared/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../shared/default_colors.dart';
import '../../shared/default_decoration.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    RxBool passwordVisibility = true.obs;
    void setPasswordVisibility() {
      passwordVisibility.value = !passwordVisibility.value;
    }

    String? firstNameValidator(String? value) {
      if (value == null || value.isEmpty) {
        return '33'.tr;
      }
      return null;
    }

    String? lastNameValidator(String? value) {
      if (value == null || value.isEmpty) {
        return '34'.tr;
      }
      return null;
    }

    String? phoneNumberValidator(String? value) {
      if (value == null || value.isEmpty) {
        return '10'.tr;
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
        return "16".tr;
      }
      return null;
    }

    String? emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return '6'.tr;
      }
      return null;
    }

    RxString selectedImagePath = ''.obs;
    void selectImage(ImageSource imageSource) async {
      final selectedItem = await ImagePicker().pickImage(source: imageSource);
      if (selectedItem != null) {
        selectedImagePath.value = selectedItem.path;
      } else {
        Get.snackbar('37'.tr, '38'.tr);
      }
    }

    Widget bottomSheet() {
      return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "46".tr,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () {
                      selectImage(ImageSource.camera);
                    },
                    icon: const Icon(LineAwesomeIcons.camera),
                    label: Text("47".tr)),
                const SizedBox(width: 50),
                ElevatedButton.icon(
                    onPressed: () {
                      selectImage(ImageSource.gallery);
                    },
                    icon: const Icon(LineAwesomeIcons.envira_gallery),
                    label: Text("48".tr)),
              ],
            )
          ],
        ),
      );
    }

    Widget imageProfile() {
      return Center(
        child: Stack(
          children: <Widget>[
            Obx(
              () => CircleAvatar(
                radius: 80.0,
                backgroundImage: selectedImagePath.value != ''
                    ? FileImage(File(selectedImagePath.value)) as ImageProvider
                    : const AssetImage("assets/images/defaultProfileImage.png"),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (builder) => bottomSheet());
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(LineAwesomeIcons.angle_left, color: DefaultColors.c3),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                focal: Alignment.topLeft,
                radius: 5.7,
                colors: [
                  Color(0XFFCAE9FF),
                  Colors.white,
                  Colors.white,
                  Color(0XFF62B6CB)
                ]),
          ),
        ),
        centerTitle: true,
        title: Text(
          '49'.tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0XFF1B4965),
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      body: Container(
        width: widthScreen,
        decoration: defaultDecoration(),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTextFormField(
                    hintText: '18'.tr,
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.perm_identity,
                    validator: firstNameValidator,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    hintText: '19'.tr,
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.perm_identity,
                    validator: lastNameValidator,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    controller: emailController,
                    hintText: '1'.tr,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: LineAwesomeIcons.at,
                    validator: emailValidator,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    controller: passwordController,
                    hintText: '2'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: LineAwesomeIcons.lock,
                    suffixIcon: IconButton(
                        color: DefaultColors.c2,
                        onPressed: () {
                          setPasswordVisibility();
                        },
                        icon: Icon(
                          passwordVisibility.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    obscureText: passwordVisibility.value,
                    autoCorrect: false,
                    validator: passwordValidator,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    controller: confirmPasswordController,
                    hintText: '11'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: LineAwesomeIcons.lock,
                    obscureText: passwordVisibility.value,
                    autoCorrect: false,
                    validator: confirmPasswordValidator,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    hintText: '20'.tr,
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    validator: phoneNumberValidator,
                    prefixIcon: LineAwesomeIcons.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    hintText: '23'.tr,
                    controller: detailsController,
                    keyboardType: TextInputType.text,
                    validator: detailsValidator,
                    prefixIcon: Icons.info_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    hintText: '21'.tr,
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    validator: addressValidator,
                    prefixIcon: Icons.location_on_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
