import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  // Product? product;
  // final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    // fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    // product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    // Navigator.pushNamed(context,ProductDetailScreen.routeName,arguments: product,);
  }

  @override
  Widget build(BuildContext context) {
    return
        // product == null
        //     ? const Loader()
        //     : product!.name.isEmpty
        //         ? const SizedBox()
        //         :
        GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            'https://img.freepik.com/free-vector/education-concept-sketch_1284-7335.jpg', // product!.images[0],
            height: 235,
            width: double.infinity,

            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: const Text(
              '\$100',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Rivaan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                'https://img.freepik.com/free-vector/vaccine-research-development-infographic_1308-50505.jpg',
                'https://img.freepik.com/free-vector/world-car-free-day-illustration_23-2148621937.jpg',
                'https://img.freepik.com/free-vector/hand-drawn-wedding-ornaments-collection_52683-64434.jpg'
              ] //product!.images
                  .map(
                    (e) => Image.network(
                      e,
                      fit: BoxFit.fitWidth,
                      width: 100,
                      height: 100,
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
