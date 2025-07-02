import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchSupportedAssetsExchangeRates(
  Dio dio,
  String baseUrl,
) async {
  final response = await dio.get('$baseUrl/exchange/rates');
  return response.data;
}
