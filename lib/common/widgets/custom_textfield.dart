// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your $hintText";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        hintText: hintText,
      ),
    );
  }
}
