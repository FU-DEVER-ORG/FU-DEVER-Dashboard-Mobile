import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/controller/id_manager.dart';

import '../controller/token_manager.dart';
import '../models/profile.dart';

class AuthController extends ApiRepository {
  static Future<dynamic> loginUser(
      String email, String password, bool rememberMe) async {
    final response = await ApiRepository.post(path: "auth/login/", options: {
      "email": email,
      "password": password,
      "rememberMe": rememberMe,
    });
    ProfileStorage.setAvatar(response['data']['user']['avatar']);
    ProfileStorage.setFirstName(response['data']['user']['firstname']);
    ProfileStorage.setLastName(response['data']['user']['lastname']);
    ProfileStorage.setLastName(response['data']['user']['email']);
    return response;
  }
}
