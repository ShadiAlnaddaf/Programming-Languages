import 'package:cached_network_image/cached_network_image.dart';
import 'package:consulting/controllers/main_app_controller.dart';
import 'package:consulting/models/specialist_model.dart';
import 'package:consulting/shared/default_colors.dart';
import 'package:consulting/shared/default_material_button.dart';
import 'package:flutter/material.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExpertInfoScreen extends StatelessWidget {
  ExpertInfoScreen({required this.thisExpert, Key? key}) : super(key: key);
  MainAppController expertShowController = Get.find();
  late Expert thisExpert;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: defaultDecoration(),
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 110,
                  backgroundImage: CachedNetworkImageProvider(thisExpert
                              .image ==
                          ''
                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'
                      : thisExpert.image)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                '${thisExpert.firstName} ${thisExpert.lastName}',
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                expertShowController.specialistName(thisExpert.specialityId),
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'My Email:\n${thisExpert.email}',
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'Phone:\n${thisExpert.number}',
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'Address:\n${thisExpert.address}',
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'About Me:\n${thisExpert.details}',
                style: const TextStyle(
                  color: DefaultColors.c3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultMaterialButton(
                    onPressed: () {
                      expertShowController.getAvailableTime(thisExpert.id);
                    },
                    label: 'Available Time',
                    color: DefaultColors.c5,
                    height: 75,
                    width: Get.width * 0.4,
                  ),
                  DefaultMaterialButton(
                    onPressed: () {
                      print(expertShowController.availableTime.data!.times);
                    },
                    label: 'Book a Date',
                    color: DefaultColors.c5,
                    height: 75,
                    width: Get.width * 0.4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
