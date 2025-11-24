import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

// ========== Address Operations ==========

Future<Map<String, dynamic>> createSolanaAddressApi({
  required Dio dio,
  required String baseUrl,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {'op': 'createsolanaaddress', 'params': []};
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

Future<Map<String, dynamic>> isValidSolanaAddressApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'isValidSolanaAddress',
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

Future<Map<String, dynamic>> createToronetSolanaAddressApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'createtoronetsolanaaddress',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Virtual Wallet Operations ==========

Future<Map<String, dynamic>> generateVirtualWalletSolanaApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String payername,
  required String currency, // USDTSOL or SOL
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/payment/';
  final data = {
    'op': 'generatevirtualwallet',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'pwd', 'value': password},
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

// ========== Verification Operations ==========

Future<Map<String, dynamic>> verifySolanaAddressApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String password,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'verify_solana_virtualaddress_enc',
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

Future<Map<String, dynamic>> verifySolanaToronetAddressApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String password,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'verify_solana_virtualaddress',
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

// ========== Transfer Operations ==========

Future<Map<String, dynamic>> transferSolanaApi({
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
    'op': 'transfer_sol',
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

Future<Map<String, dynamic>> transferSolTokenApi({
  required Dio dio,
  required String baseUrl,
  required String from,
  required String to,
  required String amount,
  required String password,
  required String contractAddress,
  required String tokenName,
  required String? useTokenAsFees,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final params = [
    {'name': 'from', 'value': from},
    {'name': 'to', 'value': to},
    {'name': 'amount', 'value': amount},
    {'name': 'pwd', 'value': password},
    {'name': 'contractaddress', 'value': contractAddress},
    {'name': 'tokenname', 'value': tokenName},
  ];
  if (useTokenAsFees != null) {
    params.add({'name': 'usetokenasfees', 'value': useTokenAsFees});
  }
  final data = {'op': 'transfer_sol_token', 'params': params};
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

Future<Map<String, dynamic>> getSolBalanceApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'getsol_balance',
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

Future<Map<String, dynamic>> getSolTokenBalanceApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'getsol_token_balance',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'contractaddress', 'value': contractAddress},
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

// ========== Transaction Operations ==========

Future<Map<String, dynamic>> getSolLatestBlockApi({
  required Dio dio,
  required String baseUrl,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {'op': 'getsol_latest_block'};
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

Future<List<Map<String, dynamic>>> getSolTransactionsApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'getsol_transactions',
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

Future<List<Map<String, dynamic>>> getSolTokenTransactionsApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String contractAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'getsol_token_transactions',
    'params': [
      {'name': 'address', 'value': address},
      {'name': 'contractaddress', 'value': contractAddress},
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

// ========== Bridge Operations ==========

Future<Map<String, dynamic>> bridgeTokenSolApi({
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
      {'name': 'network', 'value': 'sol'},
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

Future<Map<String, dynamic>> getBridgeTokenFeeSolApi({
  required Dio dio,
  required String baseUrl,
  required String contractAddress,
  required String amount,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/cryptoutils/';
  final data = {
    'op': 'get_bridge_token_fee',
    'params': [
      {'name': 'network', 'value': 'sol'},
      {'name': 'contractaddress', 'value': contractAddress},
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

// ========== Reserve Operations ==========

Future<Map<String, dynamic>> updateMerchantSolReserveApi({
  required Dio dio,
  required String baseUrl,
  required String solAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/payment/';
  final data = {
    'op': 'updatemerchant_solreserve',
    'params': [
      {'name': 'soladdress', 'value': solAddress},
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

Future<Map<String, dynamic>> updateProjectSolReserveApi({
  required Dio dio,
  required String baseUrl,
  required String solAddress,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/payment/';
  final data = {
    'op': 'updateproject_solreserve',
    'params': [
      {'name': 'soladdress', 'value': solAddress},
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

// ========== Payment Operations ==========

Future<Map<String, dynamic>> paymentInitializeSolApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String currency, // SOL or USDCSOL
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
  if (successUrl != null) {
    params.add({'name': 'success_url', 'value': successUrl});
  }
  if (cancelUrl != null) params.add({'name': 'cancel_url', 'value': cancelUrl});
  if (paymentType != null) {
    params.add({'name': 'paymenttype', 'value': paymentType});
  }
  if (passthrough != null) {
    params.add({'name': 'passthrough', 'value': passthrough});
  }
  if (commissionRate != null) {
    params.add({'name': 'commissionrate', 'value': commissionRate});
  }
  if (exchange != null) params.add({'name': 'exchange', 'value': exchange});
  if (payerAddress != null) {
    params.add({'name': 'payeraddress', 'value': payerAddress});
  }
  if (payerCity != null) params.add({'name': 'payercity', 'value': payerCity});
  if (payerState != null) {
    params.add({'name': 'payerstate', 'value': payerState});
  }
  if (payerCountry != null) {
    params.add({'name': 'payercountry', 'value': payerCountry});
  }
  if (payerZipcode != null) {
    params.add({'name': 'payerzipcode', 'value': payerZipcode});
  }
  if (payerPhone != null) {
    params.add({'name': 'payerphone', 'value': payerPhone});
  }
  if (reuseWallet != null) {
    params.add({'name': 'reusewallet', 'value': reuseWallet});
  }
  if (description != null) {
    params.add({'name': 'description', 'value': description});
  }
  if (reference != null) params.add({'name': 'reference', 'value': reference});

  final data = {'op': 'paymentinitialize', 'params': params};
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

Future<Map<String, dynamic>> recordFiatTransactionSolApi({
  required Dio dio,
  required String baseUrl,
  required String currency, // SOL or USDCSOL
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
