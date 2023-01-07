import 'package:cached_network_image/cached_network_image.dart';
import 'package:consulting/models/specialist_model.dart';
import 'package:consulting/shared/cache_helper.dart';
import 'package:consulting/shared/default_colors.dart';
import 'package:consulting/shared/network/dio_exception.dart';
import 'package:consulting/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CategoryModel {
  String title;
  String assetPath;
  RxBool isSelected;

  CategoryModel(
      {required this.title, required this.assetPath, required this.isSelected});
}

class HomeController extends GetxController {
  List<CategoryModel> category = [
    CategoryModel(
      title: 'All',
      assetPath: 'assets/icons/all.png',
      isSelected: false.obs,
    ),
    CategoryModel(
      title: 'Law',
      assetPath: 'assets/icons/law.png',
      isSelected: false.obs,
    ),
    CategoryModel(
        title: 'Medical',
        assetPath: 'assets/icons/health.png',
        isSelected: false.obs),
    CategoryModel(
        title: 'Mental Health',
        assetPath: 'assets/icons/business.png',
        isSelected: false.obs),
    CategoryModel(
        title: 'Business',
        assetPath: 'assets/icons/family.png',
        isSelected: false.obs),
    CategoryModel(
        title: 'Family',
        assetPath: 'assets/icons/mental.png',
        isSelected: false.obs),
    CategoryModel(
        title: 'Nutrition',
        assetPath: 'assets/icons/mental.png',
        isSelected: false.obs),
  ];
  RxBool isLoading = true.obs;
  RxList<RxInt> isFavorite = <RxInt>[].obs;

  void addFavorites({required String token, required int expertId}) =>
      DioHelper.addFavorite(token: token, expertId: expertId)
          .then((value) => debugPrint(value.data.toString()))
          .catchError((e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        debugPrint(errorMessage);
      });

  void deleteFavorites({required String token, required int expertId}) =>
      DioHelper.deleteFavorite(token: token, expertId: expertId)
          .then((value) => debugPrint(value.data.toString()))
          .catchError((e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        debugPrint(errorMessage);
      });

  Widget buildCategoriesCard(List<CategoryModel> category, int index) =>
      MaterialButton(
        onPressed: () {
          category[index].isSelected.value = !category[index].isSelected.value;
        },
        color:
            category[index].isSelected.value ? DefaultColors.c1 : Colors.white,
        child: Column(
          children: [
            Image.asset(
              category[index].assetPath,
              height: 50,
              width: 50,
            ),
            Text(
              category[index].title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.c3),
            ),
          ],
        ),
      );

  SpecialistModel specialists =
      SpecialistModel(message: "", status: "", data: Data(experts: []));

  Future<void> getSpecialists(
      {required String token, required RxList<RxInt> isFavorite}) async {
    DioHelper.getData(
      url: 'experts',
      token: token,
    ).then((response) {
      specialists = SpecialistModel.fromJson(response.data);
      isFavorite.clear();
      for (int i = 0; i < specialists.data.experts.length; i++) {
        isFavorite.add(RxInt(specialists.data.experts[i].favourited));
      }
      print('isFavo $isFavorite');
      isLoading.value = false;
    }).catchError((e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      debugPrint(errorMessage);
    });
  }

  Widget buildSpecialistCard(
      SpecialistModel specialists, int index, RxList<RxInt> isFavorite) {
    isFavorite.add(RxInt(specialists.data.experts[index].favourited));
    return Padding(
      padding: const EdgeInsets.only(left: 7, top: 10, bottom: 10),
      child: Container(
        width: Get.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: DefaultColors.c1,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: MaterialButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(specialists
                                  .data.experts[index].image ==
                              ''
                          ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'
                          : specialists.data.experts[index].image)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(
                          '${specialists.data.experts[index].firstName} ${specialists.data.experts[index].lastName}'),
                      Text(specialists.data.experts[index].email),
                    ],
                  ),
                ),
                RatingBarIndicator(
                  rating:
                      double.parse(specialists.data.experts[index].averageRate),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  specialists.data.experts[index].address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Obx(
                  () => IconButton(
                    onPressed: () {
                      isFavorite[index].value == 1
                          ? isFavorite[index].value = 0
                          : isFavorite[index].value = 1;
                      isFavorite[index].value == 1
                          ? addFavorites(
                              token: CacheHelper.getString('token').toString(),
                              expertId: specialists.data.experts[index].id)
                          : deleteFavorites(
                              token: CacheHelper.getString('token').toString(),
                              expertId: specialists.data.experts[index].id);
                    },
                    icon: isFavorite[index].value == 1
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 35,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            size: 35,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
