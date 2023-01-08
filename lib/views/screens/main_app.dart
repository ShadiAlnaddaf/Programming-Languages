import 'package:consulting/controllers/main_app_controller.dart';
import 'package:consulting/views/screens/favorit.dart';
import 'package:consulting/views/screens/home.dart';
import 'package:consulting/views/screens/profile.dart';
import 'package:consulting/views/screens/search.dart';
import 'package:consulting/views/screens/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  MainAppController homeController = Get.put(MainAppController() , permanent: true);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
         HomeScreen(),
        const FavoritesScreen(),
         SearchScreen(),
        const ProfileScreen(),
        const SettingScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(CupertinoIcons.house),
            selectedIcon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.heart),
            selectedIcon: Icon(CupertinoIcons.heart_fill),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.search_circle_fill),
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person_circle_fill),
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
