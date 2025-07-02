import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBalance(Dio dio, String baseUrl, String address) async {
  final response = await dio.get(
    '$baseUrl/balance',
    queryParameters: {'address': address},
  );
  return response.data;
} 