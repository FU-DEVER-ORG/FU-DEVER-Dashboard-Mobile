import 'package:fudever_dashboard/api/api_repository.dart';

class PositionController extends ApiRepository {
  static Future<dynamic> getPositions() async {
    final response = await ApiRepository.get(path: "position");
    return response;
  }
}
