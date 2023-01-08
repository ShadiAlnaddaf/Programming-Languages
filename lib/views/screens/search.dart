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
          height: Get.height,
          width: Get.width,
          decoration: defaultDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 25, right: 25, bottom: 15),
                child: DefaultTextFormField(
                  hintText: 'Search By Name',
                  controller: searchController.searchBarController,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    searchController.search(value!);
                    print(
                        searchController.searchedList.data?.experts.toString());
                    return null;
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 12,

                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                      childAspectRatio: Get.height/Get.width
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Text('Item $index'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
