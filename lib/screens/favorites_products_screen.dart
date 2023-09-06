import 'package:apps/constants.dart';
import 'package:apps/widgets/custom_btn.dart';
import 'package:apps/widgets/product_item.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_at_sub_page.dart';

class FavoritesProductsScreen extends StatelessWidget {
  const FavoritesProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarAtSubPage(subPageTitle: "Favorites"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: ListView.separated(
                  itemBuilder: (context, index) => const FavoriteItem(),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          color: AppColors.secondaryColor,
                          thickness: 1,
                          height: 1.5,
                        ),
                      ),
                  itemCount: 10),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: CustomBtn(
                  title: "Add all to my cart",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ToDo: ----------------------------------------------------------------
class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/splash2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minimal Stand",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor),
                  ),
                  Text(
                    r"$50.00",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor),
                  ),
                ],
              )),
          const Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.clear_sharp), ShoppingBagIcon()],
              ))
        ],
      ),
    );
  }
}
