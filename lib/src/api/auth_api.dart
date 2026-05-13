import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Query Operations (/auth/) ==========

Future<Map<String, dynamic>> getAuthStatusApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final url = '$baseUrl/auth/';
  final data = {
    'op': 'getauthstatus',
    'params': [
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.request(
    url,
    data: data,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> verifyAuthTokenApi(
  Dio dio,
  String baseUrl,
  String token,
) async {
  final url = '$baseUrl/auth/';
  final data = {
    'op': 'verifytoken',
    'params': [
      {'name': 'token', 'value': token},
    ],
  };
  final response = await dio.request(
    url,
    data: data,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Client Operations (/auth/cl) ==========

Future<Map<String, dynamic>> authenticateClientApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
}) async {
  final url = '$baseUrl/auth/cl';
  final data = {
    'op': 'authenticate',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> refreshAuthTokenApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String token,
}) async {
  final url = '$baseUrl/auth/cl';
  final data = {
    'op': 'refreshtoken',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'token', 'value': token},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
