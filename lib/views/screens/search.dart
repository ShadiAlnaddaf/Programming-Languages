import 'package:consulting/controllers/main_app_controller.dart';
import 'package:consulting/shared/default_decoration.dart';
import 'package:consulting/shared/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  MainAppController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: defaultDecoration(),
          child: Column(
            children: [
              DefaultTextFormField(
                hintText: 'Search By Name',
                controller: searchController.searchBarController,
                keyboardType: TextInputType.name,

              )
            ],
          ),
        ),
      ),
    );
  }
}
