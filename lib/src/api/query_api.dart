import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getEventApi(
  Dio dio,
  String baseUrl,
  String hash,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getevent',
    'params': [
      {'name': 'hash', 'value': hash},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return response.data;
}

Future<List<Map<String, dynamic>>> getBlocksApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getblocks',
    'params': [
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['blocks']);
}

Future<List<Map<String, dynamic>>> getTransactionsApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions',
    'params': [
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsToroApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_toro',
    'params': [
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsToroApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_toro',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsDollarApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_dollar',
    'params': [
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsDollarApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_dollar',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}
