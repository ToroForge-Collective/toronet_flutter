import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Address Operations ==========

Future<Map<String, dynamic>> isValidTronAddressApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'isValidTronAddress',
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

Future<Map<String, dynamic>> verifyTronVirtualAddressApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String password,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'verify_tron_virtualaddress',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'pwd', 'value': password},
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

// ========== Balance Operations ==========

Future<Map<String, dynamic>> getTronBalanceApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_balance',
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

Future<Map<String, dynamic>> getTronBalanceVirtualAddressApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_balance_virtualaddress',
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

Future<Map<String, dynamic>> getTronTokenBalanceApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String tokenName,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_token_balance',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
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

Future<Map<String, dynamic>> getTronTokenBalanceVirtualAddressApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String tokenName,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_token_balance_virtualaddress',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
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

// ========== Block Operations ==========

Future<Map<String, dynamic>> getTronLatestBlockApi({
  required Dio dio,
  required String baseUrl,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {'op': 'gettrx_latest_block', 'params': []};
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

// ========== Transaction Operations ==========

Future<List<Map<String, dynamic>>> getTronTransactionsApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_transactions',
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
        'adminpwd': adminpwd,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return List<Map<String, dynamic>>.from(response.data['transactions'] ?? []);
}

Future<List<Map<String, dynamic>>> getTronTokenTransactionsApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String tokenName,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'gettrx_token_transactions',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
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
  return List<Map<String, dynamic>>.from(response.data['transactions'] ?? []);
}

// ========== Transfer Operations ==========

Future<Map<String, dynamic>> transferTrxApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String to,
  required String amount,
  required String password,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'transfer_trx',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
      {'name': 'pwd', 'value': password},
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

Future<Map<String, dynamic>> transferTrxVirtualAddressApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String to,
  required String amount,
  required String password,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'transfer_trx_virtualaddress',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
      {'name': 'pwd', 'value': password},
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

Future<Map<String, dynamic>> transferTrxTokenApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String to,
  required String amount,
  required String password,
  required String contractAddress,
  required String tokenName,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'transfer_trx_token',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
      {'name': 'pwd', 'value': password},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
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

Future<Map<String, dynamic>> transferTrxTokenVirtualAddressApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String to,
  required String amount,
  required String password,
  required String contractAddress,
  required String tokenName,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'transfer_trx_token_virtualaddress',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
      {'name': 'pwd', 'value': password},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
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
