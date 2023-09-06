class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String image;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

List<Category> dummyCategories = [
  // Category(id: 1, name: "Popular", image: ''),
  Category(
      id: 2,
      name: "Home Decor",
      image: "https://eg-rv.homzmart.net/catalog/category/Decor-dt_3__2.jpg"),
  Category(
      id: 3,
      name: "Chairs",
      image: "https://eg-rv.homzmart.net/catalog/category/chairs-dt.jpg"),
  Category(
      id: 4,
      name: "Sofas",
      image: "https://eg-rv.homzmart.net/catalog/category/sofas-dt.jpg"),
  Category(
      id: 5,
      name: "Buffets",
      image: "https://eg-rv.homzmart.net/catalog/category/buffet-dt.jpg"),
  Category(
      id: 6,
      name: "Lightings",
      image: "https://eg-rv.homzmart.net/catalog/category/lighting-dt.jpg"),
  Category(
      id: 7,
      name: "Office Furniture",
      image: "https://eg-rv.homzmart.net/catalog/category/office_chair.jpg"),
  Category(
      id: 8,
      name: "Bathroom",
      image: "https://eg-rv.homzmart.net/catalog/category/BATHROOM-dt.jpg"),
  Category(
      id: 9,
      name: "Appliances",
      image: "https://eg-rv.homzmart.net/catalog/category/app_3.jpg"),
  Category(
      id: 10,
      name: "Full Kitchen",
      image: "https://eg-rv.homzmart.net/catalog/category/kitchen.jpg")
];
