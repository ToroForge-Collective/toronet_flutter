import 'package:dio/dio.dart';
import 'auth.dart';
import '../api/auth_api.dart';

class AuthServiceImpl implements AuthService {
  final Dio dio;
  final String baseUrl;

  AuthServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getAuthStatus({required String address}) {
    return getAuthStatusApi(dio, baseUrl, address);
  }

  @override
  Future<Map<String, dynamic>> verifyAuthToken({required String token}) {
    return verifyAuthTokenApi(dio, baseUrl, token);
  }

  @override
  Future<Map<String, dynamic>> authenticateClient({
    required String address,
    required String password,
  }) {
    return authenticateClientApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      password: password,
    );
  }

  @override
  Future<Map<String, dynamic>> refreshAuthToken({
    required String address,
    required String token,
  }) {
    return refreshAuthTokenApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      token: token,
    );
  }
}
