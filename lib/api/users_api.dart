import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/controller/id_manager.dart';
import 'package:fudever_dashboard/controller/token_manager.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }
  static Future<dynamic> filterUsers({dynamic filter=const{},String search=""}) async {
    print(filter);
    final response = await ApiRepository.get(path: "users?filter=${filter}&search=${search}");
    return response;
  }

  static Future<dynamic> editUsers({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.patch(path: "edit-profile", accessToken:token!, options: options);
    return response;
  }

  static Future<dynamic> getUserDetail() async {

    final IdManager idManager = IdManager();
    String? id = await idManager.getId();
    final response = await ApiRepository.get(path: "users/${id}");
    return response;
  }

  static Future<dynamic> changePassword({required Map<String, dynamic> options}) async {
    final TokenManager _tokenManager = TokenManager();
    final String? token = await _tokenManager.getToken();
    final response = await ApiRepository.patch(path: "edit-profile/change-password", accessToken:token!, options: options);
    return response;
  }

}
