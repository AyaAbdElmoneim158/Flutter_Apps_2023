import 'dart:convert';
import 'dart:io';
import '../../../constants/error_handel.dart';
import '../../../constants/utils.dart';
import '../../../model/product_model.dart';
import '../../../provider/user_provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';

String localhost = '192.168.1.3'; // ->
String baseUrl = "http://$localhost:8080";

class AdminServices {
  // Add product to SellProducts
  void sellProduct({
    required context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // -> get images from CloudinaryPublic -> make product -> Make request
      // ToDo: your account............
      final cloudinary = CloudinaryPublic('dbi1gcbrb', 'dtwpmlpl');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse('$baseUrl/admin/add-product'), //baseUrl
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context,
              title: 'Successfully',
              message: 'Product Added Successfully!',
              contentType: ContentType.success);
          // (context, );
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context,
          title: 'Failure',
          message: e.toString(),
          contentType: ContentType.failure);
    }
  }

// get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$baseUrl/admin/get-products'), //base url
              headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context,
          title: 'Failure',
          message: e.toString(),
          contentType: ContentType.success);
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/admin/delete-product'), //baseURL
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context,
          title: 'Failure',
          message: e.toString(),
          contentType: ContentType.success);
    }
  }
}
