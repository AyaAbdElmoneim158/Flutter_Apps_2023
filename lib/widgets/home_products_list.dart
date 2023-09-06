import 'package:apps/models/product.dart';
import 'package:apps/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummyProducts.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 360,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) =>
          Center(child: ProductItem(product: dummyProducts[index])),
    );
  }
}
