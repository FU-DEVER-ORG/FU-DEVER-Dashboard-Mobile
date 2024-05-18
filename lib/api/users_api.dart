import 'package:fudever_dashboard/api/api_repository.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }

  static Future<dynamic> editUsers() async {
    final String userId = "6640f048c6c8744884250698";
    final String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQwZjA0OGM2Yzg3NDQ4ODQyNTA2OTgiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE3MTYwMzcwMjksImV4cCI6MTcxNjY0MTgyOX0.7nTybE9_EzJn9oxMisqa1kyk5jPk0O9dYkmFUBoYEIE";
    final response = await ApiRepository.put(path: "users/edit/${userId}", accessToken:token );
    return response;
  }

  static Future<dynamic> getUserDetail({required String userId}) async {
    final response = await ApiRepository.get(path: "users/${userId}");
    return response;
  }

}
