import 'package:apps/constants.dart';
import 'package:apps/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
              height: 200,
              width: 150,
            ),
          ),
          // ClipRRect(
          //     borderRadius: BorderRadius.circular(16),
          //     child: Container(
          //       color: Colors.black,
          //       width: double.infinity,
          //       height: double.infinity,
          //     )),
          const ShoppingBagIcon(),
        ],
      ),
      const SizedBox(height: 6),
      Text(
        product.title,
        maxLines: 1,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.subColor),
      ),
      const SizedBox(height: 6),
      Text(
        "EGY: ${product.price}",
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor),
      )
    ]);
  }
}

class ShoppingBagIcon extends StatelessWidget {
  const ShoppingBagIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.beColor),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.black,
        ),
      ),
    );
  }
}
