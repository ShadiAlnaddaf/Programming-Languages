
import 'package:consulting/views/screens/specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../shared/default_colors.dart';
import 'categories_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Welcome'),
        backgroundColor: DefaultColors.c2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.center,
              focal: Alignment.topLeft,
              radius: 1.35,
              colors: [
                Color(0XFFCAE9FF),
                Colors.white,
                Colors.white,
                Color(0XFF62B6CB)
              ]),
        ),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                itemBuilder: (context, index) =>
                    buildCategoriesCard(category, index),
                itemCount: category.length,
              ),
              /* ToggleButtons(
                  isSelected: const [true,true,true,true,true,true,true,],
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/all.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/law.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/family.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/law.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/business.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/mental.png',
                          height: 50,
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/health.png',
                          height: 50,
                          width: 50,
                        ))
                  ],
                )*/),
            Expanded(
              flex: 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildSpecialistCard(specialist, index),
                itemCount: specialist.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
