abstract class AuthService {
  // ========== Query Operations ==========

  /// Get the authentication status for an address
  Future<Map<String, dynamic>> getAuthStatus({required String address});

  /// Verify an auth token
  Future<Map<String, dynamic>> verifyAuthToken({required String token});

  // ========== Client Operations ==========

  /// Authenticate a client with address and password, returning an auth token
  Future<Map<String, dynamic>> authenticateClient({
    required String address,
    required String password,
  });

  /// Refresh an existing auth token
  Future<Map<String, dynamic>> refreshAuthToken({
    required String address,
    required String token,
  });
}
