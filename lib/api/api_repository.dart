import 'dart:convert';
import 'package:http/http.dart' as http;

import '../controller/token_manager.dart';

class ApiRepository {
  static const _url = 'https://dever-dashboard-api.onrender.com/api/v1/';

  Future<Uri> image() async {
    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/de41uvd76/image/upload');
    return url;
  }

  static Future<Map<String, dynamic>> post(
      {required String path, Map<String, dynamic> options = const {}}) async {
    final response = await http.post(
      Uri.parse(_url + path),
      body: jsonEncode(options),
      headers: {'Content-Type': 'application/json'},
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }
  static Future<Map<String, dynamic>> subscribe(
      {required String path, Map<String, dynamic> options = const {},
        required String accessToken}) async {
    final response = await http.post(
      Uri.parse(_url + path),
      body: jsonEncode(options),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },

    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }

  static Future<Map<String, dynamic>> get(
      {required String path, Map<String, dynamic> options = const {}}) async {
    final response = await http.get(
      Uri.parse(_url + path),
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }

  static Future<Map<String, dynamic>> patch(
      {required String path,
      Map<String, dynamic> options = const {},
      required String accessToken}) async {
    final response = await http.patch(
      Uri.parse(_url + path),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(options),
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }

  static Future<Map<String, dynamic>> put(
      {required String path,
      Map<String, dynamic> options = const {},
      required String accessToken}) async {
    final response = await http.put(
      Uri.parse(_url + path),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(options),
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  }

  static Future<Map<String, dynamic>> test() async {
    final response = await get(path: "");
    return response;
  }

  static Future<void> loadAllAPIs() async {
    final token = await TokenManager().getToken();

    final response1 = await ApiRepository.get(path: 'loadData1', options: {
      'Authorization': 'Bearer $token',
    });

    if (response1['status'] == 'success') {
      final data1 = response1['data'];
      print('Data 1: $data1');

      final response2 = await ApiRepository.get(path: 'loadData2', options: {
        'Authorization': 'Bearer $token',
      });

      if (response2['status'] == 'success') {
        final data2 = response2['data'];
        print('Data 2: $data2');

        // Load thêm các API khác nếu cần
      } else {
        print('Failed to load data 2: ${response2['message']}');
      }
    } else {
      print('Failed to load data 1: ${response1['message']}');
    }
  }
}
