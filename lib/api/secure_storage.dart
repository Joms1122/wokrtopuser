import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = const FlutterSecureStorage();

  static const _token = 'token';

  static Future setToken(String token) async =>
      await _storage.write(key: _token, value: token);

  static Future<String?> gettoken() async => await _storage.read(key: _token);

  static Future clearToken() async => await _storage.delete(key: _token);
}
