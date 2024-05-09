import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudever_dashboard/utils/dialog.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  static Future<void> loginUser(String email, String password, bool rememberMe,
      BuildContext context) async {
    const url = 'https://dashboard.fudeverwebapi.io.vn/api/Auth/sign-in';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'username': email,
        'password': password,
        'rememberMe': rememberMe,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    final responseData = jsonDecode(response.body[0]);

    if (response.statusCode == 200) {
      responseData;
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/');
    } else {
      // ignore: use_build_context_synchronously
      DialogUtils.showLoginErrorDialog(context);
    }
  }
}
