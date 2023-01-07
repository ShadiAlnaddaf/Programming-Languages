import 'package:consulting/views/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../shared/default_colors.dart';
import '../../shared/default_decoration.dart';
import '../../shared/list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            const SizedBox(height: 5),
            const CircleAvatar(
              backgroundColor: DefaultColors.c1,
              backgroundImage: AssetImage('assets/images/person1.jpg'),
              radius: 80,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 175,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
            ),
            /*     const Divider(
              color: Colors.black,
              height: 5,
            ),*/
            const SizedBox(height: 10),

            // Menu
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  ProfileListTile(
                      title: "Name",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.identification_card_1,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Email",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.at,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Phone Number",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.phone,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Password",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.lock,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Address",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.home,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Specialty Type",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.helping_hands,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Information",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.info,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Balance",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.balance_scale,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                  ProfileListTile(
                      title: "Available Times",
                      textColor: DefaultColors.c3,
                      icon: LineAwesomeIcons.business_time,
                      onPress: () {},
                      buttonColor: DefaultColors.c3),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
