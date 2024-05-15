import 'package:fudever_dashboard/api/api_repository.dart';

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