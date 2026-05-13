import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> sendRawDataApi({
  required Dio dio,
  required String baseUrl,
  required String rawData,
}) async {
  final url = '$baseUrl/raw/';
  final data = {
    'op': 'sendrawdata',
    'params': [
      {'name': 'rawdata', 'value': rawData},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
