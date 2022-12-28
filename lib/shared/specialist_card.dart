import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'default_colors.dart';
class CardModel{
  final String fullName;
  final String speciality;
  final double rating;
  final String description;
  final String photoUrl;

  CardModel(this.fullName, this.speciality, this.rating, this.description, this.photoUrl);
}
List<CardModel> specialist = [
  CardModel('Shadi Alnaddaf', 'Doctor', 3.8, 'A Professional Doctor ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Mohammad Alnaddaf', 'Doctor', 4.4, 'A Professional Doctor ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Ahmad Alnaddaf', 'Doctor', 2.4, 'A Professional Doctor ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Shadi Alasfar', 'Teacher', 5.0, 'A Professional Teacher ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Kasem Alhalak', 'Surgeon', 1.5, 'A Professional Surgeon ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Shadi Alnaddaf', 'Doctor', 3.8, 'A Professional Doctor ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),
  CardModel('Ahmad Alnaddaf', 'Doctor', 2.4, 'A Professional Doctor ', 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1671018018~exp=1671018618~hmac=11dffcb9cf01393fff98544c2f6da98b550ce3fba049f6d7f442a1384647c6a4'),

];
List isSelected = [false ,false ,false ,false ,false ,false ,false , ];
Widget buildSpecialistCard(List<CardModel> specialist ,int index)=>Padding(
  padding: const EdgeInsets.only(left: 7 , top: 10 , bottom: 10),
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
                backgroundImage: NetworkImage(specialist[index].photoUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(specialist[index].fullName),
                  Text(specialist[index].speciality),
                ],
              ),
            ),
            RatingBarIndicator(
              rating: specialist[index].rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 25.0,
              direction: Axis.horizontal,
            ),
            Text(
              specialist[index].description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    ),
  ),
);

