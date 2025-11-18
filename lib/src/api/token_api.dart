import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

/// Helper function to get token string (currently only toro is supported)
String _getTokenString(String tokenType) {
  return tokenType.toLowerCase();
}

// ========== Metadata Operations ==========

Future<Map<String, dynamic>> getTokenNameApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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

Future<Map<String, dynamic>> getTokenSymbolApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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

Future<Map<String, dynamic>> getTokenDecimalApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'getdecimal', 'params': []};
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

// ========== Balance Operations ==========

Future<Map<String, dynamic>> getTokenBalanceApi(
  Dio dio,
  String baseUrl,
  String tokenType,
  String address,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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

// ========== Allowances Operations ==========

Future<Map<String, dynamic>> getMinimumAllowanceApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'getminimumallowance', 'params': []};
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

Future<Map<String, dynamic>> getMaximumAllowanceApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'getmaximumallowance', 'params': []};
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

Future<Map<String, dynamic>> getAllowanceApi(
  Dio dio,
  String baseUrl,
  String tokenType,
  String owner,
  String spender,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {
    'op': 'getallowance',
    'params': [
      {'name': 'owner', 'value': owner},
      {'name': 'spender', 'value': spender},
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

// ========== Fee Operations ==========

Future<Map<String, dynamic>> getTransactionFeeFixedApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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
  String tokenType,
  String amount,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
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

// ========== Supply Operations ==========

Future<Map<String, dynamic>> getReserveApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'getreserve', 'params': []};
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

Future<Map<String, dynamic>> getTollerApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'gettoller', 'params': []};
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

Future<Map<String, dynamic>> getTotalCapApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'gettotalcap', 'params': []};
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

Future<Map<String, dynamic>> getTotalReservingApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'gettotalreserving', 'params': []};
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

Future<Map<String, dynamic>> getTotalCirculatingApi(
  Dio dio,
  String baseUrl,
  String tokenType,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'gettotalcirculating', 'params': []};
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

// ========== Status Operations ==========

Future<bool> isTokenEnrolledApi(
  Dio dio,
  String baseUrl,
  String tokenType,
  String address,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {
    'op': 'isenrolled',
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
  return response.data['isenrolled'] as bool;
}

Future<bool> isTokenFrozenApi(
  Dio dio,
  String baseUrl,
  String tokenType,
  String address,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {
    'op': 'isfrozen',
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
  return response.data['isfrozen'] as bool;
}

Future<bool> isTransferOnApi(Dio dio, String baseUrl, String tokenType) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'istransferon', 'params': []};
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
  return response.data['istransfer'] as bool;
}

Future<bool> isMintOnApi(Dio dio, String baseUrl, String tokenType) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'isminton', 'params': []};
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
  return response.data['ismint'] as bool;
}

Future<bool> isBurnOnApi(Dio dio, String baseUrl, String tokenType) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/';
  final data = {'op': 'isburnon', 'params': []};
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
  return response.data['isburn'] as bool;
}

// ========== Self-Enrollment Operations ==========

Future<Map<String, dynamic>> selfEnrollTokenApi(
  Dio dio,
  String baseUrl,
  String tokenType,
  String address,
  String password,
) async {
  final tokenStr = _getTokenString(tokenType);
  final url = '$baseUrl/api/token/$tokenStr/cl';
  final data = {
    'op': 'selfenroll',
    'params': [
      {'name': 'client', 'value': address},
      {'name': 'clientpwd', 'value': password},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
