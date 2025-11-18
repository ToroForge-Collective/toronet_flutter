import 'package:dio/dio.dart';
import '../models/currency.dart';
import '../exceptions/toro_exceptions.dart';

/// Helper function to get currency string from enum
String _getCurrencyString(Currency currency) {
  switch (currency) {
    case Currency.dollar:
      return 'dollar';
    case Currency.naira:
      return 'naira';
    case Currency.euro:
      return 'euro';
    case Currency.pound:
      return 'pound';
    case Currency.egp:
      return 'egp';
    case Currency.ksh:
      return 'ksh';
    case Currency.zar:
      return 'zar';
    case Currency.eth:
      return 'eth';
    case Currency.toro:
      return 'toro';
  }
}

// ========== Query Operations (Base Currency Endpoint) ==========

Future<Map<String, dynamic>> getCurrencyBalanceApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String address,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {
    'op': 'getbalance',
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

Future<Map<String, dynamic>> getCurrencyNameApi(
  Dio dio,
  String baseUrl,
  Currency currency,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {'op': 'getname', 'params': []};
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

Future<Map<String, dynamic>> getCurrencySymbolApi(
  Dio dio,
  String baseUrl,
  Currency currency,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {'op': 'getsymbol', 'params': []};
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

// ========== Client Operations (/cl) ==========

Future<Map<String, dynamic>> transferCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String from,
  String fromPassword,
  String to,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/cl';
  final data = {
    'op': 'transfer',
    'params': [
      {'name': 'from', 'value': from},
      {'name': 'frompwd', 'value': fromPassword},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> getCurrencyBalanceClientApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String address,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/cl';
  final data = {
    'op': 'getbalance',
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

// ========== Owner Operations (/ow) ==========

Future<Map<String, dynamic>> allowTransferApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String owner,
  String ownerPassword,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ow';
  final data = {
    'op': 'allowtransfer',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> disallowTransferApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String owner,
  String ownerPassword,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ow';
  final data = {
    'op': 'disallowtransfer',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> mintCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String owner,
  String ownerPassword,
  String to,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ow';
  final data = {
    'op': 'mint',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> burnCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String owner,
  String ownerPassword,
  String from,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ow';
  final data = {
    'op': 'burn',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'ownerpwd', 'value': ownerPassword},
      {'name': 'from', 'value': from},
      {'name': 'amount', 'value': amount},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Admin Operations (/ad) ==========

Future<Map<String, dynamic>> freezeCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String address,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'freeze',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> unfreezeCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String address,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'unfreeze',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> enrollCurrencyApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String address,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'enroll',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'addr', 'value': address},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> mintCurrencyAdminApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String to,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'mint',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'to', 'value': to},
      {'name': 'amount', 'value': amount},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> burnCurrencyAdminApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String from,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'burn',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'from', 'value': from},
      {'name': 'amount', 'value': amount},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> setAllowancesApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String admin,
  String adminPassword,
  String minimum,
  String maximum,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/ad';
  final data = {
    'op': 'setallowances',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminPassword},
      {'name': 'minimum', 'value': minimum},
      {'name': 'maximum', 'value': maximum},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

// ========== Fee Operations ==========

Future<Map<String, dynamic>> getTransactionFeeFixedApi(
  Dio dio,
  String baseUrl,
  Currency currency,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {'op': 'gettransactionfeefixed', 'params': []};
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

Future<Map<String, dynamic>> getTransactionFeePercentageApi(
  Dio dio,
  String baseUrl,
  Currency currency,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {'op': 'gettransactionfeepercentage', 'params': []};
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

Future<Map<String, dynamic>> getTransactionFeeApi(
  Dio dio,
  String baseUrl,
  Currency currency,
  String amount,
) async {
  final currencyStr = _getCurrencyString(currency);
  final url = '$baseUrl/api/currency/$currencyStr/';
  final data = {
    'op': 'gettransactionfee',
    'params': [
      {'name': 'amount', 'value': amount},
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
