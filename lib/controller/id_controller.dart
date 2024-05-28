import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class IdManager {
  static const _idKey = 'authId';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveId(String id) async {
    await _storage.write(key: _idKey, value: id);
  }

  Future<String?> getId() async {
    return await _storage.read(key: _idKey);
  }

  Future<void> deleteId() async {
    await _storage.delete(key: _idKey);
  }
}
