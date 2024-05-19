import 'package:fudever_dashboard/api/api_repository.dart';

class UserController extends ApiRepository{
  static Future<dynamic> getUsers() async {
    final response = await ApiRepository.get(path: "users");
    return response;
  }

  static Future<dynamic> editUsers() async {
    final String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ4YmY5NThmMGM5MDEwN2ZlMDU2NWQiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE3MTYwOTA1OTcsImV4cCI6MTcxNjY5NTM5N30.fto_y0ZPRV6m9yYgggsJgE5smZAnZT0ocF84OhV_3Uk";
    final response = await ApiRepository.put(path: "users/edit-profile", accessToken:token );
    return response;
  }

  static Future<dynamic> getUserDetail({required String userId}) async {
    final response = await ApiRepository.get(path: "users/${userId}");
    return response;
  }

}
