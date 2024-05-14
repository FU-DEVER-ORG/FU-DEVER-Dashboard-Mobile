import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/utils/dialog.dart';
import 'package:http/http.dart' as http;

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }
  static Future<dynamic> get() async {
    final response = await ApiRepository.get(path: "");
    return response;
  }

}