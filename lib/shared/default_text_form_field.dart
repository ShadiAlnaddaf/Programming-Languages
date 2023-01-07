import 'package:consulting/shared/default_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  // ignore: prefer_typing_uninitialized_variables
  bool autoCorrect;
  // ignore: prefer_typing_uninitialized_variables
  bool obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  DefaultTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.autoCorrect = true,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: DefaultColors.c2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: DefaultColors.c5, width: 1.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: DefaultColors.c5, width: 1.8),
          ),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, color: DefaultColors.c5),
          suffixIcon: suffixIcon,
        ),
        autocorrect: autoCorrect,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
