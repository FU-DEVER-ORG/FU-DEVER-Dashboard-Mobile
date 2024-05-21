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
    if (response != null && response['status'] == 'success') {
      final data = response['data']['user'];
      final Profile profile = Profile(
        email: data['email'],
        avatar: data['avatar'],
        firstName: data['firstname'],
        lastName: data['lastname'],
        id: data['_id'],
      );
      // Lưu ID ở đây
      // final token = response['data']['token'];
      // final id = response['data']['user']['id'];
      // await TokenManager().saveToken(token);
      // await IdManager().saveId(id);
      return response;
    }
    return response;
  }
}
