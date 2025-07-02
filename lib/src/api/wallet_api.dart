import 'package:dio/dio.dart';

Future<Map<String, dynamic>> createWalletApi(
  Dio dio,
  String baseUrl,
  String password,
) async {
  final response = await dio.post(
    '$baseUrl/wallet/create',
    data: {'password': password},
  );
  return response.data;
}

Future<Map<String, dynamic>> importWalletFromPrivateKeyApi(
  Dio dio,
  String baseUrl,
  String privateKey,
  String password,
) async {
  final response = await dio.post(
    '$baseUrl/wallet/import',
    data: {'pvkey': privateKey, 'password': password},
  );
  return response.data;
}

Future<bool> verifyWalletPasswordApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
) async {
  final response = await dio.post(
    '$baseUrl/wallet/verify-password',
    data: {'address': address, 'password': password},
  );
  return response.data['isValid'] as bool;
}

Future<String> getWalletKeyApi(Dio dio, String baseUrl, String address) async {
  final response = await dio.get(
    '$baseUrl/wallet/key',
    queryParameters: {'address': address},
  );
  return response.data['key'] as String;
}

Future<bool> isTNSAvailableApi(Dio dio, String baseUrl, String username) async {
  final response = await dio.get(
    '$baseUrl/tns/isNameUsed',
    queryParameters: {'username': username},
  );
  // isNameUsed returns true if taken, so available = !taken
  return !(response.data['isUsed'] as bool);
}

Future<void> configureTNSApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
  String username,
) async {
  await dio.post(
    '$baseUrl/tns/setName',
    data: {'address': address, 'password': password, 'username': username},
  );
}
