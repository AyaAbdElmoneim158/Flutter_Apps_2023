import 'package:apps/constants.dart';
import 'package:apps/widgets/login_form.dart';
import 'package:apps/widgets/top_row.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 62),
                TopRow(),
                SizedBox(height: 20),
                Text(
                  "Hello!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: AppColors.mainColor),
                ),
                Text(
                  "WELCOME BACK",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.mainColor),
                ),
                SizedBox(height: 36),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
