import 'package:consulting/controllers/login_controller.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:consulting/views/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

import '../../shared/default_colors.dart';
import '../../shared/default_material_button.dart';
import '../../shared/default_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

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
                height: Get.height * 0.40,
                width: Get.width * 0.7,
                child: Lottie.asset('assets/lotties/login.json'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: loginController.formKey,
                        child: Column(
                          children: [
                            DefaultTextFormField(
                              controller: loginController.emailController,
                              hintText: "1".tr,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.email,
                              validator: loginController.emailValidator,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Obx(
                              () => DefaultTextFormField(
                                controller: loginController.passwordController,
                                hintText: "2".tr,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock,
                                suffixIcon: IconButton(
                                  color: DefaultColors.c5,
                                  onPressed: () {
                                    loginController.setPasswordVisibility();
                                  },
                                  icon: Icon(
                                    loginController.passwordVisibility.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                obscureText:
                                    loginController.passwordVisibility.value,
                                autoCorrect: false,
                                validator: loginController.passwordValidator,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultMaterialButton(
                              onPressed: () async {
                                if (loginController.formKey.currentState!
                                    .validate()) {
                                  loginController.login(
                                      loginController.emailController.text,
                                      loginController.passwordController.text);
                                }
                              },
                              label: '3'.tr,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4'.tr,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.off(() => SignUpScreen())!.then(
                                          (value) =>
                                              Get.delete<LoginController>());
                                    },
                                    child: Text('5'.tr,
                                        style: const TextStyle(
                                            color: DefaultColors.c3,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ],
                        ),
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
