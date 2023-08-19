import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key, required this.hintText, this.obscureText = false});
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder(
            {double width = 1.0, Color color = AppColors.secondaryColor}) =>
        OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: color, width: width));

    return TextField(
      cursorColor: AppColors.mainColor,
      obscureText: obscureText,
      obscuringCharacter: '*',
      style: const TextStyle(color: AppColors.subColor),
      decoration: InputDecoration(
          hintText: hintText,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder:
              outlineInputBorder(width: 2, color: AppColors.mainColor),
          fillColor: AppColors.whiteColor),
    );
  }
}
