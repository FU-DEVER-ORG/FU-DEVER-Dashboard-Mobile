import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepository {
  static const _url = 'https://dever-dashboard-api.onrender.com/api/v1/';

  static Future<dynamic> post(
      {required String path,Map<String, dynamic> options = const {}}) async {
    final response = await http.post(
      Uri.parse(_url+path),
      body: jsonEncode(options),
      headers: {'Content-Type': 'application/json'},
    );
    // final responseData = jsonDecode(response.body);
    return response.statusCode;
  }
  static Future<dynamic> get(
      {required String path,Map<String, dynamic> options = const {}}) async {
    final response = await http.get(
      Uri.parse(_url+path));
    final responseData = jsonDecode(response.body);
    return responseData;
  }
}
