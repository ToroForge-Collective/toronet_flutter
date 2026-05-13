import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> isAddressApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final url = '$baseUrl/util/';
  final data = {
    'op': 'isaddress',
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

Future<Map<String, dynamic>> getTransactionCountApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final url = '$baseUrl/util/';
  final data = {
    'op': 'gettransactioncount',
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
