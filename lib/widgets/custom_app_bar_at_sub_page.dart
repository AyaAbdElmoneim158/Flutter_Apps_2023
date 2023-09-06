import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBarAtSubPage extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarAtSubPage({super.key, required this.subPageTitle});
  final String subPageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColor,
          )),
      title: Text(
        subPageTitle,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);
}
