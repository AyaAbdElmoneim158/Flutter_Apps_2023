import 'package:apps/models/category.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });
  late final int id;
  late final String title;
  late final int price;
  late final String description;
  late final Category category;
  late final List<String> images;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = Category.fromJson(json['category']);
    images = List.castFrom<dynamic, String>(json['images']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category.toJson();
    data['images'] = images;
    return data;
  }
}

List<Product> dummyProducts = [
  Product(
      id: 1,
      title: "LR-0208-8 Venel Tableau-Multi Color - LR-208-8",
      price: 599,
      description:
          r"A Modern tableau with high quality venel print. It is with a layer of protection against dust, water and weather conditions. This tableau is made of 12 mm wood.Handmade",
      category: Category(
          id: 1,
          name: "Home Decor",
          image:
              "https://eg-rv.homzmart.net/catalog/category/Decor-dt_3__2.jpg"),
      images: [
        "https://eg-rv.homzmart.net/catalog/product/2/0/208_1__10.jpg",
        "https://eg-rv.homzmart.net/catalog/product/2/0/208_2__1_8.jpg",
        "https://eg-rv.homzmart.net/catalog/product/1/_/1_713.jpg"
      ]),
  Product(
    id: 2,
    title: "Musky Wood Towel Rails Beige - 30×30×50×30 cm",
    price: 627,
    description: r'''
Brand Name: Art Wood Decor
Color: Beige
Material: Musky Wood
Type: Towel Holder
Height in cm: 30
Width in cm: 30
Length in cm: 50
Depth in cm: 30
Warranty: 3 Years
Country of origin: Egypt
''',
    category: Category(
        id: 1,
        name: "Home Decor",
        image: "https://eg-rv.homzmart.net/catalog/category/Decor-dt_3__2.jpg"),
    images: [
      "https://eg-rv.homzmart.net/catalog/product/a/r/art.w.aw_070.jpg",
      "https://eg-rv.homzmart.net/catalog/product/1/1/11_167.jpg",
      "https://eg-rv.homzmart.net/catalog/product/1/2/12_165.jpg"
    ],
  ),
];
 // Product(
  //     id: ,
  //     title: "",
  //     price: ,
  //     description:r"" ",
  //     category: Category(
  //         id: ,
  //         name: "",
  //         image: ""),
  //     images: [
  //       "",
  //       "",
  //       ""
  //     ]),