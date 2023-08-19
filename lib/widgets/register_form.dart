import 'package:apps/constants.dart';
import 'package:apps/widgets/custom_btn.dart';
import 'package:apps/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration:
            const BoxDecoration(color: AppColors.whiteColor, boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              color: AppColors.secondaryColor,
              blurRadius: 8,
              spreadRadius: 2)
        ]),
        child: Form(
            child: Column(
          children: [
            const CustomField(hintText: "Name"),
            const SizedBox(height: 12),
            const CustomField(hintText: "Email"),
            const SizedBox(height: 12),
            const CustomField(hintText: "Password", obscureText: true),
            const SizedBox(height: 12),
            const CustomField(hintText: "Confirm password", obscureText: true),
            const SizedBox(height: 12),
            CustomBtn(title: "Sign up", onPressed: () {}),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: RichText(
                  text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Already have account? ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subColor),
                  ),
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor),
                  ),
                ],
              )),
            ),
          ],
        )));
  }
}
