import 'package:consulting/views/screens/favorit.dart';
import 'package:consulting/views/screens/home.dart';
import 'package:consulting/views/screens/profile.dart';
import 'package:consulting/views/screens/search.dart';
import 'package:consulting/views/screens/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomeScreen(),
        const FavoritesScreen(),
        const SearchScreen(),
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
