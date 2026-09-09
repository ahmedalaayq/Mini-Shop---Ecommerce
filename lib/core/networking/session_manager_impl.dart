import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:mini_shop/core/networking/session_manager.dart';

class SessionManagerImpl implements SessionManager {

  final FlutterSecureStorage _storage;
  SessionManagerImpl({
    required this._storage,
  });

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  @override
  Future<void> saveSession({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);

    if (refreshToken != null) {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    }
  }

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<bool> hasSession() async {
    final accessToken = await getAccessToken();

    return accessToken != null && accessToken.isNotEmpty;
  }

  @override
  Future<void> clearSession() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}

