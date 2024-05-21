import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/login_request/login_request.dart';

class TokenNotifier extends StateNotifier<String?> {
  TokenNotifier() : super(null) {
    _loadToken();
  }

  final TokenManager _tokenManager = TokenManager();

  Future<void> _loadToken() async {
    state = await _tokenManager.getToken();
  }

  Future<void> setToken(String token) async {
    await _tokenManager.saveToken(token);
    state = token;
  }

  // Future<void> clearToken() async {
  //   await _tokenManager.deleteToken();
  //   state = null;
  // }
}

final tokenProvider = StateNotifierProvider<TokenNotifier, String?>((ref) {
  return TokenNotifier();
});

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

final id = StateNotifierProvider<IdNotifier, String?>((ref) {
  return IdNotifier();
});
