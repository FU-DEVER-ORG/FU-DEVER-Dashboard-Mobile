import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/provider/token_provider.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }

  static Future<dynamic> editUsers({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.put(path: "edit-profile", accessToken:token!, options: options);
    return response;
  }

  static Future<dynamic> getUserDetail({required String userId}) async {
    final response = await ApiRepository.get(path: "users/${userId}");
    return response;
  }

}
