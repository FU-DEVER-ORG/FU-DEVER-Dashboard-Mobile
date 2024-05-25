import 'package:fudever_dashboard/api/api_repository.dart';

class DepartmentController extends ApiRepository {
  static Future<dynamic> getDepartments() async {
    final response = await ApiRepository.get(path: "department");
    return response;
  }
}
