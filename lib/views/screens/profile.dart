import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../shared/default_colors.dart';
import '../../shared/default_decoration.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
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
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1B4965),
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        body: Container(
            width: screenWidth,
            decoration: defaultDecoration(),
            child: Column(children: [
              const SizedBox(height: 5),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/defaultProfileImage.png"),
                    radius: 80,
                  ),
                  Positioned(
                    bottom: -4,
                    right: 4,
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        LineAwesomeIcons.user_edit,
                        color: DefaultColors.c3,
                      ),
                      onPressed: () {
                        Get.to(() => const EditProfileScreen());
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 200,
                child: MaterialButton(
                  onPressed: () {
                    Get.to(() => const EditProfileScreen());
                  },
                  color: DefaultColors.c3.withOpacity(0.8),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.edit_1,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hussam Tayfour",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.at,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "hussam@gmail.com",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.phone,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "0982424241",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.map_marker,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Kiswe",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.people_carry,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Doctor",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.identification_badge,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "hussam@gmail.com",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.wallet,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "123\$",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineAwesomeIcons.business_time,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Available Times",
                        style: TextStyle(
                          color: DefaultColors.c3,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ])));
  }
}
