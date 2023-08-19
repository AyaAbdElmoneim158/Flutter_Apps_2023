import 'package:apps/constants.dart';
import 'package:apps/widgets/register_form.dart';
import 'package:apps/widgets/top_row.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                SizedBox(height: 48),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor),
                ),
                SizedBox(height: 36),
                RegisterForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
