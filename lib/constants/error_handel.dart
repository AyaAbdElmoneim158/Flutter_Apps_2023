import 'dart:convert';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context,
          title: "Failure",
          message: jsonDecode(response.body)['msg'],
          contentType: ContentType.failure);
      break;
    case 500:
      showSnackBar(context,
          title: "Failure",
          message: jsonDecode(response.body)['error'],
          contentType: ContentType.failure);
      break;
    default:
      showSnackBar(context,
          title: "Failure",
          message: "error....!",
          contentType: ContentType.warning);
  }
}
