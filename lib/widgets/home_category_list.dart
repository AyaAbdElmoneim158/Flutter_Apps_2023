import 'package:apps/constants.dart';
import 'package:apps/models/category.dart';
import 'package:flutter/material.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ItemHomeHorizontalList(category: dummyCategories[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: dummyCategories.length),
    );
  }
}

class ItemHomeHorizontalList extends StatelessWidget {
  const ItemHomeHorizontalList({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.beColor),
          child: Image.network(category.image),
        ),
        const SizedBox(height: 5),
        Text(
          category.name,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.subColor),
        )
      ],
    );
  }
}
