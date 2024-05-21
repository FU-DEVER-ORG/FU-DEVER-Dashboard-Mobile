import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const _tokenKey = 'admin_token';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
    // UserModel().token = token;
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  // Future<void> deleteToken() async {
  //   await storage.delete(key: _tokenKey);
  // }
}

class IdManager {
  static const _id = 'admin_id';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> saveId(String id) async {
    await storage.write(key: _id, value: id);
    // UserModel().token = token;
  }

  Future<String?> getId() async {
    return await storage.read(key: _id);
  }

  // Future<void> deleteToken() async {
  //   await storage.delete(key: _id);
  // }
}

class UserModel {
  String? token;
  final String? id;
  final String? avatar;

  UserModel({
    this.token,
    this.id,
    this.avatar,
  });
}
