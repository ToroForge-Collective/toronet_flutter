import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';
import '../models/role_type.dart';

/// Helper function to get role string from enum
String _getRoleString(RoleType roleType) {
  switch (roleType) {
    case RoleType.admin:
      return 'admin';
    case RoleType.superadmin:
      return 'superadmin';
    case RoleType.debugger:
      return 'debugger';
  }
}

/// Helper function to get operation name prefix from role type
String _getRolePrefix(RoleType roleType) {
  switch (roleType) {
    case RoleType.admin:
      return 'admin';
    case RoleType.superadmin:
      return 'superadmin';
    case RoleType.debugger:
      return 'debugger';
  }
}

// ========== Query Operations ==========

Future<bool> isRoleApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String address,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr';
  final data = {
    'op': 'is$rolePrefix',
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
  return response.data['is$rolePrefix'] as bool;
}

Future<Map<String, dynamic>> getRoleIndexApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String address,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr';
  final data = {
    'op': 'get${rolePrefix}index',
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

Future<Map<String, dynamic>> getNumberOfRoleApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr';
  final data = {'op': 'getnumberof$rolePrefix', 'params': []};
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

Future<Map<String, dynamic>> getRoleByIndexApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  int index,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr';
  final data = {
    'op': 'get${rolePrefix}byindex',
    'params': [
      {'name': 'index', 'value': index},
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

// ========== Owner/Admin Operations ==========

Future<Map<String, dynamic>> initRoleApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String owner,
  String ownerPassword,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr/ow';
  final data = {
    'op': 'init$rolePrefix',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> addRoleApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String owner,
  String ownerPassword,
  String address,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr/ow';
  final data = {
    'op': 'add$rolePrefix',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> removeRoleApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String owner,
  String ownerPassword,
  String address,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr/ow';
  final data = {
    'op': 'remove$rolePrefix',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> removeAllRolesApi(
  Dio dio,
  String baseUrl,
  RoleType roleType,
  String owner,
  String ownerPassword,
) async {
  final roleStr = _getRoleString(roleType);
  final rolePrefix = _getRolePrefix(roleType);
  final url = '$baseUrl/api/role/$roleStr/ow';
  final data = {
    'op': 'removeall${rolePrefix}s',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
