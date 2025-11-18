import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> getEventApi(
  Dio dio,
  String baseUrl,
  String hash,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getevent',
    'params': [
      {'name': 'hash', 'value': hash},
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

Future<List<Map<String, dynamic>>> getBlocksApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getblocks',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['blocks']);
}

Future<List<Map<String, dynamic>>> getTransactionsApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsToroApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_toro',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsToroApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_toro',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsDollarApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_dollar',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsDollarApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_dollar',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<Map<String, dynamic>> getExchangeRatesApi(
  Dio dio,
  String baseUrl,
) async {
  final url = '$baseUrl/api/query';
  final data = {'op': 'getexchangerates', 'params': []};
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

Future<Map<String, dynamic>> getAddrRoleApi(
  Dio dio,
  String baseUrl,
  String addr,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrrole',
    'params': [
      {'name': 'addr', 'value': addr},
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

Future<Map<String, dynamic>> getAddrBalanceApi(
  Dio dio,
  String baseUrl,
  String addr,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrbalance',
    'params': [
      {'name': 'addr', 'value': addr},
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

Future<Map<String, dynamic>> getBlockApi(
  Dio dio,
  String baseUrl,
  String blockId,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getblock',
    'params': [
      {'name': 'number', 'value': blockId},
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

Future<Map<String, dynamic>> getTransactionByIdApi(
  Dio dio,
  String baseUrl,
  String hash,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransaction',
    'params': [
      {'name': 'hash', 'value': hash},
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

Future<Map<String, dynamic>> getReceiptApi(
  Dio dio,
  String baseUrl,
  String hash,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getreceipt',
    'params': [
      {'name': 'hash', 'value': hash},
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

Future<List<Map<String, dynamic>>> getTransactionsNairaApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_naira',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsNairaApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_naira',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsEuroApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_euro',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsEuroApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_euro',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsPoundApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_pound',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsPoundApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_pound',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsEgpApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_egp',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsEgpApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_egp',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsKshApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_ksh',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsKshApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_ksh',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsZarApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_zar',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsZarApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_zar',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsEthApi(
  Dio dio,
  String baseUrl,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactions_eth',
    'params': [
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsEthApi(
  Dio dio,
  String baseUrl,
  String addr,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'getaddrtransactions_eth',
    'params': [
      {'name': 'addr', 'value': addr},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getTransactionsRangeApi(
  Dio dio,
  String baseUrl,
  String startDate,
  String endDate,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final data = {
    'op': 'gettransactionsrange',
    'params': [
      {'name': 'startdate', 'value': startDate},
      {'name': 'enddate', 'value': endDate},
      {'name': 'count', 'value': count},
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}

Future<List<Map<String, dynamic>>> getAddrTransactionsRangeApi(
  Dio dio,
  String baseUrl,
  String addr,
  String startDate,
  String endDate,
  String? token,
  int count,
) async {
  final url = '$baseUrl/api/query';
  final params = [
    {'name': 'addr', 'value': addr},
    {'name': 'startdate', 'value': startDate},
    {'name': 'enddate', 'value': endDate},
    {'name': 'count', 'value': count},
  ];
  if (token != null) {
    params.add({'name': 'token', 'value': token});
  }
  final data = {'op': 'getaddrtransactionsrange', 'params': params};
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
  return List<Map<String, dynamic>>.from(response.data['transactions']);
}
