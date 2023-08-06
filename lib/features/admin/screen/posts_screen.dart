import 'package:apps/features/admin/screen/add_product_screen.dart';
import 'package:flutter/material.dart';
import '../../nav/account/widgets/single_product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  // List<Product>? products;
  // final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    // products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  // void deleteProduct(Product product, int index) {
  //   adminServices.deleteProduct(
  //     context: context,
  //     product: product,
  //     onSuccess: () {
  //       products!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  final productData = [
    {
      "id": 1,
      "title": "Product 1",
      "description": "Description 1",
      "price": 100,
      "imageUrl": "https://picsum.photos/200/300",
    },
    {
      "id": 2,
      "title": "Product 2",
      "description": "Description 2",
      "price": 200,
      "imageUrl": "https://picsum.photos/200/400",
    },
    {
      "id": 3,
      "title": "Product 3",
      "description": "Description 3",
      "price": 300,
      "imageUrl": "https://picsum.photos/100/300",
    },
  ]; //products![index];

  @override
  Widget build(BuildContext context) {
    return
        // products == null
        //     ? const Loader()
        //     :
        Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: productData.length, //products!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: SingleProduct(
                  image: productData[index]["imageUrl"].toString(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      productData[index]["title"].toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, //=> deleteProduct(productData, index),
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddProductScreen(),
        )), //navigateToAddProduct,
        tooltip: 'Add a Product',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
