import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchSupportedAssetsExchangeRates(
  Dio dio,
  String baseUrl,
) async {
  final String url = '$baseUrl/api/query';
  final data = {'op': 'getexchangerates', 'params': []};
  final response = await dio.request(
    url,
    data: data,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  return response.data as Map<String, dynamic>;
}
