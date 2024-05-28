import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/id_controller.dart';

class IdNotifier extends StateNotifier<String?> {
  IdNotifier() : super(null) {
    _loadId();
  }

  final IdManager _idManager = IdManager();

  Future<void> _loadId() async {
    state = await _idManager.getId();
  }

  Future<void> setToken(String id) async {
    await _idManager.saveId(id);
    state = id;
  }

  // Future<void> clearToken() async {
  //   await _tokenManager.deleteToken();
  //   state = null;
  // }
}

final idProvider = StateNotifierProvider<IdNotifier, String?>((ref) {
  return IdNotifier();
});
