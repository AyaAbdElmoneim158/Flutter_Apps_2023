import 'dart:convert';

import '../../../constants/error_handel.dart';
import '../../../constants/utils.dart';
import '../../bottomBar/screen/bottom_bar_screen.dart';
import '../../../model/user_model.dart';
import '../../../provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static String localhost = 'localhost'; // ->
  static String baseUrl = "http://$localhost:8080";

  static void signupUser({
    required BuildContext context,
    required String name,
    required String password,
    required String email,
  }) {
    User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '');
    http.post(Uri.parse('$baseUrl/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }).then((res) {
      debugPrint(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context,
                title: 'Successfully signed up',
                message: "Account created! Login with the same credentials!",
                contentType: ContentType.success);
          });
    }).catchError((err) {
      showSnackBar(context,
          title: 'Failure',
          message: err.toString(),
          contentType: ContentType.failure);
    });
  }

  static void signinUser({
    required context,
    required String password,
    required String email,
  }) {
    http.post(Uri.parse('$baseUrl/api/signin'),
        body: jsonEncode({
          'password': password,
          'email': email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }).then((res) {
      debugPrint(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context,
                title: 'Successfully signed up',
                message: "Account created! Login with the same credentials!",
                contentType: ContentType.success);

            // logic -> Save token at sharedStorage(Because it's change when each SignIn) -> setUser at Provider -> Navigate to navbar (user || Administrator)
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            prefs.setString('x-auth-token', jsonDecode((res.body))['token']);

            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBarScreen.routeName,
              (route) => false,
            );
          });
    }).catchError((err) {
      showSnackBar(context,
          title: 'Failure',
          message: err.toString(),
          contentType: ContentType.failure);
    });
  }

  static void getUserData({
    required context,
  }) async {
    try {
      // logic -> get token at sharedStorage -> validation to This token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$baseUrl/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response res = await http.get(
          Uri.parse('$baseUrl/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(res.body);
      }
    } catch (e) {
      showSnackBar(context,
          title: 'Failure',
          message: e.toString(),
          contentType: ContentType.failure);
    }
  }
}
