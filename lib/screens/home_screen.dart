import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      const ItemHomeHorizontalList(),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                  itemCount: 10),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 360,
                // crossAxisSpacing: 16,
                // mainAxisSpacing: 16,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) => const ProductItem(),
            )
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/splash2.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.beColor),
              child: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),
      const Text(
        "Black Simple Lamp",
        maxLines: 1,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.subColor),
      ),
      const SizedBox(height: 6),
      const Text(
        r"$ 12.00",
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor),
      )
    ]);
  }
}

class ItemHomeHorizontalList extends StatelessWidget {
  const ItemHomeHorizontalList({super.key, this.icon = Icons.chair_outlined});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.beColor),
          child: Icon(
            icon,
            color: AppColors.subColor,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Armchair",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.subColor),
        )
      ],
    );
  }
}
