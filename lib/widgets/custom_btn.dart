import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 54,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.mainColor),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor),
          )),
    );
  }
}
