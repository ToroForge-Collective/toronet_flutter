import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBlockchainStatus(
  Dio dio,
  String baseUrl,
) async {
  final String url = '$baseUrl/api/blockchain';
  
  final response = await dio.request(
    url,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},  
    ),
  );
  if (response.data['result'] == false) throw Exception(response.data['error']);
  return response.data;
}

Future<Map<String, dynamic>> fetchLatestBlockData(
  Dio dio,
  String baseUrl,
) async {
  final String url = '$baseUrl/api/blockchain';
  final data = {
    'op': 'getblock',
    'params': [
      {'name': 'id', 'value': 'latest'},
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

Future<Map<String, dynamic>> getTransaction(
  Dio dio,
  String baseUrl,
  String transactionId,
) async {
  final String url = '$baseUrl/api/blockchain';
  final data = {
    'op': 'gettransaction',
    'params': [
      {'name': 'id', 'value': transactionId},
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

Future<Map<String, dynamic>> getReceipt(
  Dio dio,
  String baseUrl,
  String transactionId,
) async {
  final String url = '$baseUrl/api/blockchain';
  final data = {
    'op': 'getreceipt',
    'params': [
      {'name': 'id', 'value': transactionId},
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

Future<Map<String, dynamic>> getRevertReason(
  Dio dio,
  String baseUrl,
  String transactionId,
) async {
  final String url = '$baseUrl/api/blockchain';
  final data = {
    'op': 'getrevertreason',
    'params': [
      {'name': 'id', 'value': transactionId},
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


