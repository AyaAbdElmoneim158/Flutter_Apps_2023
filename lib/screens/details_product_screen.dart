import 'package:apps/constants.dart';
import 'package:apps/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [TopPartAtProductDetails(), BottomPartAtProductDetails()],
      ),
    );
  }
}

// ToDo: ----------------------------------------------------------------
class BottomPartAtProductDetails extends StatelessWidget {
  const BottomPartAtProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Minimal Stand",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainColor),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r"$50",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor),
                ),
                Row(
                  children: [
                    CustomIcon(
                        size: 24,
                        iconBg: AppColors.secondaryColor,
                        icon: Icons.add),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "01",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.subColor),
                      ),
                    ),
                    CustomIcon(
                        size: 24,
                        iconBg: AppColors.secondaryColor,
                        icon: Icons.minimize),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.star, color: AppColors.yellowColor),
                Padding(
                  padding: EdgeInsets.only(left: 4, right: 16),
                  child: Text(
                    "4.5",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.subColor),
                  ),
                ),
                Text(
                  "(50 reviews)",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subColor),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "A Modern tableau with high quality venel print. It is with a layer of protection against dust, water and weather conditions. This tableau is made of 12 mm wood.Handmade/ A Modern tableau with high quality venel print. It is with a layer of protection against dust, water and weather conditions. This tableau is made of 12 mm wood.Handmade",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subColor),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomIcon(
                    size: 48,
                    iconBg: AppColors.disableColor,
                    icon: Icons.bookmark_outline_outlined),
                const SizedBox(width: 20),
                Expanded(
                    child: CustomBtn(title: "Add to card", onPressed: () {})),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopPartAtProductDetails extends StatelessWidget {
  const TopPartAtProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(flex: 4, child: Container(color: Colors.white)),
          Expanded(
            flex: 8,
            child: Stack(
                alignment: Alignment.centerLeft,
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(64)),
                    child: Image.network(
                      "https://eg-rv.homzmart.net/catalog/product/a/r/art.w.aw_070.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  const Positioned(
                      left: -32,
                      top: 16,
                      child: CustomIcon(
                          size: 48,
                          iconBg: Colors.white,
                          icon: Icons.arrow_back_ios)),
                  const Positioned(
                      left: -32,
                      bottom: 164,
                      child: CustomIcon(
                          size: 48,
                          iconBg: Colors.white,
                          icon: Icons.arrow_back_ios)),
                ]),
          )
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.size,
    required this.iconBg,
    required this.icon,
    this.borderRadius = 8,
    this.iconColor = AppColors.mainColor,
  });

  final double size;
  final Color iconBg;
  final Color iconColor;
  final double borderRadius;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(4),
        width: size + 4,
        height: size + 4,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 32.0,
              spreadRadius: 2.0,
            ),
          ],
          color: iconBg,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
