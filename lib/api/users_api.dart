import 'package:fudever_dashboard/api/api_repository.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }
  static Future<dynamic> editUsers() async {
    final String userId = "6640f048c6c8744884250698";
    final String token="";
    final response = await ApiRepository.put(path: "users/edit/${userId}", accessToken:token );
    return response;
  }
}
