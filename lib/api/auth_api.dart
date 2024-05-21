import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/models/profile.dart';

late List<Profile> avatarUrl;

class AuthController extends ApiRepository {
  static Future<dynamic> loginUser(String email, String password) async {
    final response = await ApiRepository.post(path: "auth/login/", options: {
      "email": email,
      "password": password,
    });
    if (response != null && response['status'] == 'success') {
      final data = response['data']['user'];
      final Profile profile = Profile(
        email: data['email'],
        avatar: data['avatar'],
        firstName: data['firstname'],
        lastName: data['lastname'],
      );
      return response;
    }
    return response;
  }
}
