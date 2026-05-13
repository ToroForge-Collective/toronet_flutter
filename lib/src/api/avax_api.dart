import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> updateProjectAvaxReserveApi({
  required Dio dio,
  required String baseUrl,
  required String avaxAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'updateproject_avaxreserve',
    'params': [
      {'name': 'avaxaddress', 'value': avaxAddress},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminpwd,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> updateMerchantAvaxReserveApi({
  required Dio dio,
  required String baseUrl,
  required String avaxAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'updatemerchant_avaxreserve',
    'params': [
      {'name': 'avaxaddress', 'value': avaxAddress},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminpwd,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
