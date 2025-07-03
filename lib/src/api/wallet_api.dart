import 'package:dio/dio.dart';

Future<Map<String, dynamic>> createWalletApi(
  Dio dio,
  String baseUrl,
  String password,
) async {
  final String url = '$baseUrl/api/keystore';
  final data = {
    'op': 'createkey',
    'params': [
      {'name': 'pwd', 'value': password},
    ],
  };
  final response = await dio.post(url, data: data);
  return response.data;
}

Future<Map<String, dynamic>> importWalletFromPrivateKeyApi(
  Dio dio,
  String baseUrl,
  String privateKey,
  String password,
) async {
  final String url = '$baseUrl/api/keystore';
  final data = {
    'op': 'importkey',
    'params': [
      {"name": "prvkey", "value": privateKey},
      {"name": "pwd", "value": password},
    ],
  };
  final response = await dio.post(url, data: data);
  if(response.data['result'] == false) throw Exception(response.data['error']);
  return response.data;
}

Future<bool> verifyWalletPasswordApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
) async {
  final String url = '$baseUrl/api/keystore';
  final data = {
    'op': 'verifykey',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
    ],
  };

  final response = await dio.post(url, data: data);
  if(response.data['result'] == false) throw Exception(response.data['error']);
  return response.data['result'] as bool;
}

Future< Map<String, dynamic>> getWalletKeyApi(Dio dio, String baseUrl, String address, String password) async {
  final String url = '$baseUrl/api/keystore';
  final data = {
    'op': 'getkey',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
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
  if(response.data['result'] == false) throw Exception(response.data['error']);
  return response.data['keystoredata'] as Map<String, dynamic>;
}

Future<bool> isTNSAvailableApi(Dio dio, String baseUrl, String username) async {
  final String url = '$baseUrl/api/tns';
  final data = {
    'op': 'isnameused',
    'params': [
      {'name': 'name', 'value': username},
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
 // print("isTNSAvailableApi: ${response.data}");
  if(response.data['result'] == false) throw Exception(response.data['error']);
  // isNameUsed returns true if taken, so available = !taken
  return !(response.data['isused'] as bool);
}

Future<void> configureTNSApi(
  Dio dio,
  String baseUrl,
  String address,
  String password,
  String username,
) async {
  final String url = '$baseUrl/api/tns/cl';
  final data = {
    'op': 'setname',
    'params': [
      {'name': 'client', 'value': address},
      {'name': 'clientpwd', 'value': password},
      {'name': 'name', 'value': username},
    ],
  };
  final response = await dio.post(url, data: data);
  if(response.data['result'] == false) throw Exception(response.data['error']);
  //print("configureTNSApi: ${response.data}");
}
