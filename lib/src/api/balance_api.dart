import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBalance(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final String url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrbalance',
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
  //print("getWalletKeyApi: ${response.data}");

  return response.data as Map<String, dynamic>;
}
