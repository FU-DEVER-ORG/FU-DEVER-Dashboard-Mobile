import 'package:fudever_dashboard/api/api_repository.dart';

class AuthController extends ApiRepository {
  static Future<int?> loginUser(
      String email, String password, bool rememberMe) async {
    final response = await ApiRepository.post(path: "auth/login/", options: {
      "email": email,
      "password": password,
      "rememberMe": rememberMe,
    });
    return response;
  }
}
