import 'package:fudever_dashboard/api/api_repository.dart';

class MajorController extends ApiRepository {
  static Future<dynamic> getMajors() async {
    final response = await ApiRepository.get(path: "major");
    return response;
  }
}
