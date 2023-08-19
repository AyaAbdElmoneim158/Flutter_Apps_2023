import 'package:apps/constants.dart';
import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.secondaryColor,
            thickness: 2,
            height: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.mainColor)),
            child: Image.asset(
              'assets/chair.png',
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            height: 2,
          ),
        )
      ],
    );
  }
}
