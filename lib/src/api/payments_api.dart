import 'package:dio/dio.dart';
import '../payments/payments.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> depositFundsApi({
  required Dio dio,
  required String baseUrl,
  required String userAddress,
  required String username,
  required String amount,
  required Currency currency,
  required String admin,
  required String adminpwd,
}) async {
  final response = await dio.post(
    '$baseUrl/payments/deposit',
    data: {
      'userAddress': userAddress,
      'username': username,
      'amount': amount,
      'currency': currency.name,
      'admin': admin,
      'adminpwd': adminpwd,
    },
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> confirmDepositApi({
  required Dio dio,
  required String baseUrl,
  required String currency,
  required String txid,
  required String? paymentType,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final params = [
    {'name': 'currency', 'value': currency},
    {'name': 'txid', 'value': txid},
  ];
  if (paymentType != null) {
    params.add({'name': 'paymenttype', 'value': paymentType});
  }
  final data = {'op': 'recordfiattransaction', 'params': params};
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

Future<List<Map<String, dynamic>>> getBankListUSDApi({
  required Dio dio,
  required String baseUrl,
}) async {
  final response = await dio.get('$baseUrl/api/payment/banklist/usd');
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return List<Map<String, dynamic>>.from(response.data['banks'] ?? []);
}

Future<List<Map<String, dynamic>>> getBankListNGNApi({
  required Dio dio,
  required String baseUrl,
}) async {
  final response = await dio.get('$baseUrl/api/payment/banklist/ngn');
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return List<Map<String, dynamic>>.from(response.data['banks'] ?? []);
}

Future<Map<String, dynamic>> recordFiatWithdrawalApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String currency,
  required String token,
  required String payername,
  required String payeremail,
  required String payeraddress,
  required String payercity,
  required String payerstate,
  required String payercountry,
  required String payerzipcode,
  required String payerphone,
  required String description,
  required String amount,
  required String accounttype,
  required String bankname,
  required String routingno,
  required String accountno,
  required String? expirydate,
  required String accountname,
  required String recipientstate,
  required String recipientzip,
  required String recipientphone,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final params = [
    {'name': 'addr', 'value': address},
    {'name': 'pwd', 'value': password},
    {'name': 'currency', 'value': currency},
    {'name': 'token', 'value': token},
    {'name': 'payername', 'value': payername},
    {'name': 'payeremail', 'value': payeremail},
    {'name': 'payeraddress', 'value': payeraddress},
    {'name': 'payercity', 'value': payercity},
    {'name': 'payerstate', 'value': payerstate},
    {'name': 'payercountry', 'value': payercountry},
    {'name': 'payerzipcode', 'value': payerzipcode},
    {'name': 'payerphone', 'value': payerphone},
    {'name': 'description', 'value': description},
    {'name': 'amount', 'value': amount},
    {'name': 'accounttype', 'value': accounttype},
    {'name': 'bankname', 'value': bankname},
    {'name': 'routingno', 'value': routingno},
    {'name': 'accountno', 'value': accountno},
    {'name': 'accountname', 'value': accountname},
    {'name': 'recipientstate', 'value': recipientstate},
    {'name': 'recipientzip', 'value': recipientzip},
    {'name': 'recipientphone', 'value': recipientphone},
  ];
  if (expirydate != null) {
    params.add({'name': 'expirydate', 'value': expirydate});
  }
  final data = {'op': 'recordfiatwithdrawal', 'params': params};
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

Future<Map<String, dynamic>> getFiatWithdrawalByTxidApi({
  required Dio dio,
  required String baseUrl,
  required String txid,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'getfiatwithdrawals_txid',
    'params': [
      {'name': 'admin', 'value': admin},
      {'name': 'adminpwd', 'value': adminpwd},
      {'name': 'txid', 'value': txid},
    ],
  };
  final response = await dio.post(
    url,
    data: data,
    options: Options(headers: {'Content-Type': 'application/json'}),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> verifyBankAccountNameNGNApi({
  required Dio dio,
  required String baseUrl,
  required String destinationInstitutionCode,
  required String accountNumber,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'verifybankaccountname_ngn',
    'params': [
      {
        'name': 'destinationInstitutionCode',
        'value': destinationInstitutionCode,
      },
      {'name': 'accountNumber', 'value': accountNumber},
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

Future<Map<String, dynamic>> getFiatTransactionByTxidApi({
  required Dio dio,
  required String baseUrl,
  required String txid,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'getfiattransactions_txid',
    'params': [
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

Future<List<Map<String, dynamic>>> getPendingTransactionApi({
  required Dio dio,
  required String baseUrl,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {'op': 'getpendingtransaction', 'params': []};
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

Future<List<Map<String, dynamic>>> getFiatTransactionsAddressRangeApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String startDate,
  required String endDate,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'getfiattransactions_address_range',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'startdate', 'value': startDate},
      {'name': 'enddate', 'value': endDate},
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

Future<List<Map<String, dynamic>>> getFiatWithdrawalsAddressRangeApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String startDate,
  required String endDate,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'getfiatwithdrawals_address_range',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'startdate', 'value': startDate},
      {'name': 'enddate', 'value': endDate},
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
  return List<Map<String, dynamic>>.from(response.data['withdrawals'] ?? []);
}

Future<List<Map<String, dynamic>>> getFiatTransactionsRecorderRangeApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String startDate,
  required String endDate,
  String? currency,
  String? token,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final params = [
    {'name': 'addr', 'value': address},
    {'name': 'startdate', 'value': startDate},
    {'name': 'enddate', 'value': endDate},
  ];
  if (currency != null) {
    params.add({'name': 'currency', 'value': currency});
  }
  if (token != null) {
    params.add({'name': 'token', 'value': token});
  }
  final data = {'op': 'getfiattransactions_recorder_range', 'params': params};
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

Future<List<Map<String, dynamic>>> getFiatWithdrawalsRecorderRangeApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String startDate,
  required String endDate,
  String? currency,
  String? token,
  required String admin,
  required String adminpwd,
}) async {
  final url = '$baseUrl/api/payment/toro/';
  final params = [
    {'name': 'addr', 'value': address},
    {'name': 'startdate', 'value': startDate},
    {'name': 'enddate', 'value': endDate},
  ];
  if (currency != null) {
    params.add({'name': 'currency', 'value': currency});
  }
  if (token != null) {
    params.add({'name': 'token', 'value': token});
  }
  final data = {'op': 'getfiatwithdrawals_recorder_range', 'params': params};
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
  return List<Map<String, dynamic>>.from(response.data['withdrawals'] ?? []);
}
