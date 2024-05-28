
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/token_controller.dart';

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
