
import 'dart:convert';

import 'package:blood_bank/binding/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}){
  switch(response.statusCode){
    case 200 :
      onSuccess();
      break;

    case 400:
      SnackBarError(context: context, message: jsonDecode(response.body)['msg']);
      break;

    case 500:
      SnackBarError(context: context, message: jsonDecode(response.body)['error']);
      break;

    default :
      SnackBarError(context: context, message:response.body);
  }
}