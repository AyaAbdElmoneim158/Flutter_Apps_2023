import 'package:flutter/material.dart';

String uri = 'http://<yourip>:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    // 'https://img.freepik.com/free-vector/vaccine-research-development-infographic_1308-50505.jpg',
    // 'https://img.freepik.com/free-vector/world-car-free-day-illustration_23-2148621937.jpg',
    // 'https://img.freepik.com/free-vector/hand-drawn-wedding-ornaments-collection_52683-64434.jpg'
    'https://m.media-amazon.com/images/I/71WlGA7Ct+L._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/710ybG+VwoL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/7102I1D+77L._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71PaCYgmufL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/61Vk5g9BXZL._SX3000_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/fashion.jpeg',
    },
  ];
}
