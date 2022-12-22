import 'package:consulting/shared/default_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration defaultDecoration() {
  return const BoxDecoration(
    gradient: RadialGradient(
        center: Alignment.center,
        focal: Alignment.topLeft,
        radius: 1.35,
        colors: [
          DefaultColors.c4,
          Colors.white,
          Colors.white,
          DefaultColors.c2
        ]),
  );
}
