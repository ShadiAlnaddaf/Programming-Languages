import 'package:consulting/shared/default_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultMaterialButton extends StatelessWidget {
  double height;
  double width;
  Color? color;
  final VoidCallback onPressed;
  String label;

  DefaultMaterialButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.width = 150,
      this.height = 50,
      this.color = DefaultColors.c3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        onPressed: onPressed,
        color: color,
        child: Text(
          label,textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20 ,),
        ),
      ),
    );
  }
}
