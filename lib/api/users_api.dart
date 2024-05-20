import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/provider/token_provider.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }

  static Future<dynamic> editUsers({required Map<String, dynamic> options}) async {
    // final TokenManager _tokenManager = TokenManager();
    // final String? token = await _tokenManager.getToken();
    final String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ4YmY5NThmMGM5MDEwN2ZlMDU2NWQiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE3MTYyMDQ1MDAsImV4cCI6MTcxNjgwOTMwMH0.XmdGB7mnYIt8sv-jOUJJGTZw8wuIOSh_uZ8_7wmuXuQ";
    final response = await ApiRepository.patch(path: "edit-profile", accessToken:token!, options: options);
    return response;
  }

  static Future<dynamic> getUserDetail({required String userId}) async {
    final response = await ApiRepository.get(path: "users/${userId}");
    return response;
  }

  static Future<dynamic> changePassword({required Map<String, dynamic> options}) async {
    // final TokenManager _tokenManager = TokenManager();
    // final String? token = await _tokenManager.getToken();
    final String userId = "";
    final String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ4YmY5NThmMGM5MDEwN2ZlMDU2NWQiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE3MTYyMDQ1MDAsImV4cCI6MTcxNjgwOTMwMH0.XmdGB7mnYIt8sv-jOUJJGTZw8wuIOSh_uZ8_7wmuXuQ";
    final response = await ApiRepository.put(path: "users/${userId}/password", accessToken:token!, options: options);
    return response;
  }

}
