import 'package:consulting/controllers/register_controller.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:consulting/views/screens/login.dart';
import 'package:consulting/views/screens/register_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../shared/default_colors.dart';
import '../../shared/default_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          decoration: defaultDecoration(),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.3,
                width: Get.width,
                child: Lottie.asset('assets/lotties/signup.json'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: registerController.formKey,
                        child: Column(
                          children: [
                            DefaultTextFormField(
                              controller: registerController.emailController,
                              hintText: '1'.tr,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.email,
                              validator: registerController.emailValidator,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Obx(
                              () => DefaultTextFormField(
                                controller:
                                    registerController.passwordController,
                                hintText: '2'.tr,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock,
                                suffixIcon: IconButton(
                                    color: DefaultColors.c2,
                                    onPressed: () {
                                      registerController
                                          .setPasswordVisibility();
                                    },
                                    icon: Icon(
                                      registerController
                                              .passwordVisibility.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    )),
                                obscureText:
                                    registerController.passwordVisibility.value,
                                autoCorrect: false,
                                validator: registerController.passwordValidator,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Obx(
                              () => DefaultTextFormField(
                                controller: registerController
                                    .confirmPasswordController,
                                hintText: '11'.tr,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock,
                                obscureText:
                                    registerController.passwordVisibility.value,
                                autoCorrect: false,
                                validator:
                                    registerController.confirmPasswordValidator,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width * 0.4,
                                height: Get.height * 0.15,
                                child: IconButton(
                                  onPressed: () {
                                    if (registerController.formKey.currentState!
                                        .validate()) {
                                      registerController.isExpert = false;
                                      Get.to(() => ContinueSignUpScreen());
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/user.svg'),
                                ),
                              ),
                              Text(
                                '12'.tr,
                                style: const TextStyle(
                                    color: DefaultColors.c3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width * 0.4,
                                height: Get.height * 0.15,
                                child: IconButton(
                                  onPressed: () {
                                    if (registerController.formKey.currentState!
                                        .validate()) {
                                      registerController.isExpert = true;
                                      Get.to(() => ContinueSignUpScreen());
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/images/sp-list.svg'),
                                ),
                              ),
                              Text(
                                '13'.tr,
                                style: const TextStyle(
                                    color: DefaultColors.c3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '14'.tr,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(() => LoginScreen());
                            },
                            child: Text(
                              '15'.tr,
                              style: const TextStyle(
                                  color: DefaultColors.c3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
