import 'package:apps/constants.dart';
import 'package:apps/screens/register_screen.dart';
import 'package:apps/widgets/custom_btn.dart';
import 'package:apps/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
            const CustomField(hintText: "Email"),
            const SizedBox(height: 12),
            const CustomField(hintText: "Password", obscureText: true),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subColor),
                )),
            const SizedBox(height: 20),
            CustomBtn(title: "Log in", onPressed: () {}),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              )),
              child: const Text(
                "Sign up",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.subColor),
              ),
            ),
          ],
        )));
  }
}
