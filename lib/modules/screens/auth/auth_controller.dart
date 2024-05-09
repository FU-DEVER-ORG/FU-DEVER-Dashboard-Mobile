import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/api_repository.dart';

class AuthController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;

  void login(BuildContext context) async {
    // Unfocus any focused widget to dismiss the keyboard
    FocusScope.of(context).unfocus();

    // Assuming you have a GlobalKey<FormState> called loginFormKey defined somewhere
  }
}
