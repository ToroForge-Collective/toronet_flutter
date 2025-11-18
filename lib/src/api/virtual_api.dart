import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> createVirtualWalletApi(
  Dio dio,
  String baseUrl,
  String address,
  String payername,
  String currency,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'generatevirtualwallet',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'payername', 'value': payername},
      {'name': 'currency', 'value': currency},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> fetchVirtualWalletApi(
  Dio dio,
  String baseUrl,
  String virtualWalletId,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/payment/';
  final data = {
    'op': 'retrievevirtualwallet',
    'params': [
      {'name': 'virtualwallet', 'value': virtualWalletId},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> fetchVirtualWalletByAddressApi(
  Dio dio,
  String baseUrl,
  String address,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/payment/';
  final data = {
    'op': 'getvirtualwalletbyaddress',
    'params': [
      {'name': 'address', 'value': address},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> updateVirtualWalletTransactionsApi(
  Dio dio,
  String baseUrl,
  String walletAddress,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/payment/';
  final data = {
    'op': 'updatevirtualwallettransactions',
    'params': [
      {'name': 'walletaddress', 'value': walletAddress},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
