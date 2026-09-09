abstract interface class SessionManager {
  Future<void> saveSession({required String accessToken, String? refreshToken});

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> hasSession();

  Future<void> clearSession();
}
