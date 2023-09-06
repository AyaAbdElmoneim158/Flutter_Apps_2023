import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
          text: const TextSpan(
        children: [
          TextSpan(
            text: "MAKE HOME\n",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.disableColor),
          ),
          TextSpan(
            text: "BEAUTIFUL",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.subColor),
          ),
        ],
      )),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.disableColor,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.subColor,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
