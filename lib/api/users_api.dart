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
    final response = await ApiRepository.patch(path: "edit-profile", accessToken:token!, options: options);
    return response;
  }

  static Future<dynamic> getUserDetail() async {
    String userId = "6648bf958f0c90107fe0565d";
    final response = await ApiRepository.get(path: "users/${userId}");
    return response;
  }

  static Future<dynamic> changePassword({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.patch(path: "edit-profile/change-password", accessToken:token!, options: options);
    return response;
  }

}
