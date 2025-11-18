import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Query Operations (/tns) ==========

Future<Map<String, dynamic>> getTNSNameApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final url = '$baseUrl/api/tns';
  final data = {
    'op': 'getname',
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

Future<Map<String, dynamic>> getTNSAddressApi(
  Dio dio,
  String baseUrl,
  String name,
) async {
  final url = '$baseUrl/api/tns';
  final data = {
    'op': 'getaddr',
    'params': [
      {'name': 'name', 'value': name},
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

Future<bool> isTNSAddressAssignedApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final url = '$baseUrl/api/tns';
  final data = {
    'op': 'isaddrassigned',
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
  return response.data['isassigned'] as bool;
}

Future<bool> isTNSSetOnApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/tns';
  final data = {'op': 'isseton', 'params': []};
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
  return response.data['isset'] as bool;
}

Future<bool> isTNSUpdateOnApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/tns';
  final data = {'op': 'isupdateon', 'params': []};
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
  return response.data['isupdate'] as bool;
}

Future<bool> isTNSDeleteOnApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/tns';
  final data = {'op': 'isdeleteon', 'params': []};
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
  return response.data['isdelete'] as bool;
}

// ========== Client Operations (/tns/cl) ==========

Future<Map<String, dynamic>> updateTNSNameApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
  String name,
) async {
  final url = '$baseUrl/api/tns/cl';
  final data = {
    'op': 'updatename',
    'params': [
      {'name': 'client', 'value': address},
      {'name': 'clientpwd', 'value': password},
      {'name': 'name', 'value': name},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> deleteTNSNameApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
) async {
  final url = '$baseUrl/api/tns/cl';
  final data = {
    'op': 'deletename',
    'params': [
      {'name': 'client', 'value': address},
      {'name': 'clientpwd', 'value': password},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Owner Operations (/tns/ow) ==========

Future<Map<String, dynamic>> initTNSApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'inittns',
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

Future<Map<String, dynamic>> setTNSSetNameOnApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setseton',
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

Future<Map<String, dynamic>> setTNSSetNameOffApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setsetoff',
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

Future<Map<String, dynamic>> setTNSUpdateOnApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setupdateon',
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

Future<Map<String, dynamic>> setTNSUpdateOffApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setupdateoff',
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

Future<Map<String, dynamic>> setTNSDeleteOnApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setdeleteon',
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

Future<Map<String, dynamic>> setTNSDeleteOffApi(
  Dio dio,
  String baseUrl,
  String owner,
  String ownerPassword,
) async {
  final url = '$baseUrl/api/tns/ow';
  final data = {
    'op': 'setdeleteoff',
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

// ========== Admin Operations (/tns/ad) ==========

Future<Map<String, dynamic>> adminSetTNSNameApi(
  Dio dio,
  String baseUrl,
  String admin,
  String adminPassword,
  String address,
  String name,
) async {
  final url = '$baseUrl/api/tns/ad';
  final data = {
    'op': 'adminsetname',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
      {'name': 'name', 'value': name},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> adminUpdateTNSNameApi(
  Dio dio,
  String baseUrl,
  String admin,
  String adminPassword,
  String address,
  String name,
) async {
  final url = '$baseUrl/api/tns/ad';
  final data = {
    'op': 'adminupdatename',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
      {'name': 'name', 'value': name},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> adminDeleteTNSNameApi(
  Dio dio,
  String baseUrl,
  String admin,
  String adminPassword,
  String address,
) async {
  final url = '$baseUrl/api/tns/ad';
  final data = {
    'op': 'admindeletename',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
