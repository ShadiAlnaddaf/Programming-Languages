// ignore_for_file: must_be_immutable

import 'package:consulting/controllers/home_controller.dart';
import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../shared/default_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getSpecialists(
      isFavorite: homeController.isFavorite,
        token: CacheHelper.getString('token').toString());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: defaultDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: Get.width * 0.95,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: DefaultColors.c1,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset('assets/lotties/home.json'),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'How Are You',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Find Every Advice You Want',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Keep Looking',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: DefaultColors.c2,
                    ),
                    hintText: 'Find Your Advice',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          const BorderSide(color: DefaultColors.c2, width: 1.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          const BorderSide(color: DefaultColors.c2, width: 1.8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: DefaultColors.c3)),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Obx(() => homeController
                      .buildCategoriesCard(homeController.category, index)),
                  itemCount: homeController.category.length,
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Obx(() {
                    return homeController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                homeController.buildSpecialistCard(
                                    homeController.specialists,
                                    index,
                                    homeController.isFavorite),
                            itemCount:
                                homeController.specialists.data.experts.length,
                          );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
