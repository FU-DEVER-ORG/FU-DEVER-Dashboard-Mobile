import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/controller/token_controller.dart';

class LeetcodeController extends ApiRepository{
  static Future<dynamic> getLeaderBoard() async {
    final response = await ApiRepository.get(path: "leetcode");
    return response;
  }

  static Future<dynamic> editUsers({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.patch(path: "edit-profile", accessToken:token!, options: options);
    return response;
  }

  static Future<dynamic> subscribeLeetcode({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.subscribe(path: "leetcode/subcribe", accessToken:token!, options: options);
    return response;
  }

}