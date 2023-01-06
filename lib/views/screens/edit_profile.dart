import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../shared/default_colors.dart';
import '../../shared/default_decoration.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
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
        title: const Text(
          'Edit Profile',
          style: TextStyle(
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
        child: Column(),
      ),
    );
  }
}
