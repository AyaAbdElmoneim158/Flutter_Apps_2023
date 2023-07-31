// ignore_for_file: public_member_api_docs, sort_constructors_first
// CustomBtn
import 'package:flutter/material.dart';

import 'package:apps/constants/global_variables.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String data;

  const CustomBtn({super.key, this.onPressed, required this.data});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: GlobalVariables.secondaryColor,
        ),
        child: Text(data,
            style: const TextStyle(
              color: GlobalVariables.backgroundColor,
            )),
      ),
    );
  }
}
