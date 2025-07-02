import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBlockchainStatus(
  Dio dio,
  String baseUrl,
) async {
  final response = await dio.get('$baseUrl/blockchain/status');
  return response.data;
}

Future<Map<String, dynamic>> fetchLatestBlockData(
  Dio dio,
  String baseUrl,
) async {
  final response = await dio.get('$baseUrl/blockchain/latest-block');
  return response.data;
}

Future<List<Map<String, dynamic>>> fetchBlocksData(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final response = await dio.get(
    '$baseUrl/blockchain/blocks',
    queryParameters: {'count': count},
  );
  return List<Map<String, dynamic>>.from(response.data['blocks']);
}

Future<List<Map<String, dynamic>>> fetchBlockchainTransactions(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final response = await dio.get(
    '$baseUrl/blockchain/transactions',
    queryParameters: {'count': count},
  );
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}
