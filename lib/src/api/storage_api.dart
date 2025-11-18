import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Query Operations (/storage) ==========

Future<bool> isStorageOnApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/storage';
  final data = {'op': 'isstorageon', 'params': []};
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
  return response.data['isstorageon'] as bool;
}

Future<Map<String, dynamic>> getStorageVersionApi(
  Dio dio,
  String baseUrl,
) async {
  final url = '$baseUrl/api/storage';
  final data = {'op': 'getstorageversion', 'params': []};
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

Future<bool> isContractRegisteredApi(
  Dio dio,
  String baseUrl,
  String contractAddress,
) async {
  final url = '$baseUrl/api/storage';
  final data = {
    'op': 'iscontractregistered',
    'params': [
      {'name': 'contract', 'value': contractAddress},
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
  return response.data['isregistered'] as bool;
}

Future<bool> isStorageOwnerApi(Dio dio, String baseUrl, String address) async {
  final url = '$baseUrl/api/storage';
  final data = {
    'op': 'isowner',
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
  return response.data['isowner'] as bool;
}

Future<Map<String, dynamic>> getStorageOwnerApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/storage';
  final data = {'op': 'getowner', 'params': []};
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

// ========== Owner Operations (/storage/ow) ==========

Future<Map<String, dynamic>> setStorageOnApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'setstorageon',
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

Future<Map<String, dynamic>> setStorageOffApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'setstorageoff',
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

Future<Map<String, dynamic>> registerContractApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
  String contractAddress,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'registercontract',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'contract', 'value': contractAddress},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> unregisterContractApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
  String contractAddress,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'unregistercontract',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'contract', 'value': contractAddress},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> increaseStorageVersionApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'increasestorageversion',
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

Future<Map<String, dynamic>> decreaseStorageVersionApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'decreasestorageversion',
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

Future<Map<String, dynamic>> setStorageVersionApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
  String version,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'setstorageversion',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'version', 'value': version},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> transferStorageOwnershipApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
  String newOwner,
) async {
  final url = '$baseUrl/api/storage/ow';
  final data = {
    'op': 'transferownership',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'newowner', 'value': newOwner},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
