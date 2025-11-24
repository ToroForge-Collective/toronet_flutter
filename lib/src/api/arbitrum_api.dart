import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Bridge Operations ==========

Future<Map<String, dynamic>> bridgeTokenArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String password,
  required String contractAddress,
  required String tokenName,
  required String amount,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'bridge_token',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'pwd', 'value': password},
      {'name': 'network', 'value': 'arb'},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
      {'name': 'amount', 'value': amount},
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

Future<Map<String, dynamic>> getBalanceArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'get_balance',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'network', 'value': 'arb'},
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

Future<Map<String, dynamic>> getTokenBalanceArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String tokenName,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'get_tokenbalance',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'network', 'value': 'arb'},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Transaction Operations ==========

Future<List<Map<String, dynamic>>> getTransactionsArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'get_transactions',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'network', 'value': 'arb'},
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

Future<List<Map<String, dynamic>>> getTokenTransactionsArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String tokenName,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'get_tokentransactions',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'network', 'value': 'arb'},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'tokenname', 'value': tokenName},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return List<Map<String, dynamic>>.from(response.data['transactions'] ?? []);
}

// ========== Payment Operations ==========

Future<Map<String, dynamic>> paymentInitializeArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String currency, // USDCARB
  required String token, // TORO
  required String amount,
  String? successUrl,
  String? cancelUrl,
  String? paymentType,
  String? passthrough,
  String? commissionRate,
  String? exchange,
  required String payername,
  String? payerAddress,
  String? payerCity,
  String? payerState,
  String? payerCountry,
  String? payerZipcode,
  String? payerPhone,
  String? reuseWallet,
  String? description,
  String? reference,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/payment/';
  final params = [
    {'name': 'address', 'value': address},
    {'name': 'pwd', 'value': password},
    {'name': 'currency', 'value': currency},
    {'name': 'token', 'value': token},
    {'name': 'amount', 'value': amount},
    {'name': 'payername', 'value': payername},
  ];
  if (successUrl != null) params.add({'name': 'success_url', 'value': successUrl});
  if (cancelUrl != null) params.add({'name': 'cancel_url', 'value': cancelUrl});
  if (paymentType != null) params.add({'name': 'paymenttype', 'value': paymentType});
  if (passthrough != null) params.add({'name': 'passthrough', 'value': passthrough});
  if (commissionRate != null) params.add({'name': 'commissionrate', 'value': commissionRate});
  if (exchange != null) params.add({'name': 'exchange', 'value': exchange});
  if (payerAddress != null) params.add({'name': 'payeraddress', 'value': payerAddress});
  if (payerCity != null) params.add({'name': 'payercity', 'value': payerCity});
  if (payerState != null) params.add({'name': 'payerstate', 'value': payerState});
  if (payerCountry != null) params.add({'name': 'payercountry', 'value': payerCountry});
  if (payerZipcode != null) params.add({'name': 'payerzipcode', 'value': payerZipcode});
  if (payerPhone != null) params.add({'name': 'payerphone', 'value': payerPhone});
  if (reuseWallet != null) params.add({'name': 'reusewallet', 'value': reuseWallet});
  if (description != null) params.add({'name': 'description', 'value': description});
  if (reference != null) params.add({'name': 'reference', 'value': reference});

  final data = {
    'op': 'paymentinitialize',
    'params': params,
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

Future<Map<String, dynamic>> recordFiatTransactionArbitrumApi({
  required Dio dio,
  required String baseUrl,
  required String currency, // USDCARB
  required String txid,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/payment/';
  final data = {
    'op': 'recordpayment',
    'params': [
      {'name': 'currency', 'value': currency},
      {'name': 'txid', 'value': txid},
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

