import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/utils/dialog.dart';
import 'package:http/http.dart' as http;

class AuthController extends ApiRepository{
  static Future<void> loginUser(String email, String password, bool rememberMe,
      BuildContext context) async {
    final response = await ApiRepository.post(path: "Auth/sign-in", options: {
      "username": email,
      "password": password,
      "rememberMe": rememberMe,
    });
    if (response!=null){
      print(response['body']['user']);
      Navigator.of(context).pushNamed('/');
      // ignore: use_build_context_synchronously
    }else{
      DialogUtils.showLoginErrorDialog(context);
    }
  }
}