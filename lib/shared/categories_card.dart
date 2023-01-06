import 'package:flutter/material.dart';

import '../../shared/default_colors.dart';
class CategoryModel {
  final String title;
  final String assetPath;
  final VoidCallback function;

  CategoryModel(this.title, this.assetPath, this.function);
}
List<CategoryModel> category = [
  CategoryModel('All', 'assets/icons/all.png', () {}),
  CategoryModel('Law', 'assets/icons/law.png', () {}),
  CategoryModel('Health', 'assets/icons/health.png', () {}),
  CategoryModel('Business', 'assets/icons/business.png', () {}),
  CategoryModel('Family', 'assets/icons/family.png', () {}),
  CategoryModel('Mental', 'assets/icons/mental.png', () {}),
];
Widget buildCategoriesCard(List<CategoryModel> category , int index)=>MaterialButton(
  splashColor: Colors.blue,
  onPressed: category[index].function,
  child: Column(
    children: [
      Image.asset(category[index].assetPath,
        height: 50,
        width: 50,
      ),
      Text(
        category[index].title,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: DefaultColors.c3),
      ),
    ],
  ),
);