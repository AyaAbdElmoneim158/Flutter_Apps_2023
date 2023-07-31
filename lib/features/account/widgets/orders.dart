import '../../../constants/global_variables.dart';
import 'single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    // orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List listOfOrders = [
      'https://img.freepik.com/free-photo/biotechnology-specialist-laboratory-conducting-experiments_23-2150468704.jpg',
      'https://img.freepik.com/free-photo/biotechnology-specialist-laboratory-conducting-experiments_23-2150468704.jpg',
      'https://img.freepik.com/free-photo/biotechnology-specialist-laboratory-conducting-experiments_23-2150468704.jpg',
      'https://img.freepik.com/free-photo/biotechnology-specialist-laboratory-conducting-experiments_23-2150468704.jpg',
    ];

    return
        // orders == null? const Loader():
        Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listOfOrders.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context,OrderDetailScreen.routeName,arguments: orders![index],);
                },
                child: SingleProduct(
                  image: listOfOrders[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
