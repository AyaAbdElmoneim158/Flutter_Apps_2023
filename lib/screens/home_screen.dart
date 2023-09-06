import 'package:apps/widgets/custom_app_bar.dart';
import 'package:apps/widgets/home_category_list.dart';
import 'package:apps/widgets/home_products_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            SizedBox(height: 16),
            HomeCategoryList(),
            SizedBox(height: 16),
            HomeProductsList()
          ],
        ),
      ),
    );
  }
}
