import 'dart:convert';

import 'package:dio/dio.dart';

import '../exceptions/toro_exceptions.dart';

/// Sign a message using a Toronet wallet's private key
Future<Map<String, dynamic>> signMessageApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String message,
}) async {
  final url = '$baseUrl/keystore';
  final data = {
    'op': 'signMessage',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
      {'name': 'message', 'value': message},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data as Map<String, dynamic>;
}

/// Recover the signer address from a message and its signature
Future<Map<String, dynamic>> getMessageSignerApi({
  required Dio dio,
  required String baseUrl,
  required String message,
  required String signedMessage,
}) async {
  final url = '$baseUrl/keystore';
  final data = {
    'op': 'getMessageSigner',
    'params': [
      {'name': 'message', 'value': message},
      {'name': 'signedmessage', 'value': signedMessage},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data as Map<String, dynamic>;
}

/// Call a function on a deployed Toronet smart contract.
///
/// By default the SDK handles encoding automatically:
/// - [functionArguments] are pipe-joined and URI-encoded
/// - [abi] is JSON-stringified and URI-encoded
///
/// To bypass automatic encoding, supply the already-encoded strings via
/// [rawFunctionArguments] and/or [rawAbi].
Future<Map<String, dynamic>> callContractFunctionApi({
  required Dio dio,
  required String baseUrl,
  required String address,
  required String password,
  required String contractAddress,
  required String functionName,
  List<String> functionArguments = const [],
  List<Map<String, dynamic>> abi = const [],
  String? rawFunctionArguments,
  String? rawAbi,
}) async {
  final url = '$baseUrl/keystore';

  final encodedArgs =
      rawFunctionArguments ?? Uri.encodeComponent(functionArguments.join('|'));
  final encodedAbi = rawAbi ?? Uri.encodeComponent(jsonEncode(abi));

  final data = {
    'op': 'callContractFunction',
    'params': [
      {'name': 'addr', 'value': address},
      {'name': 'pwd', 'value': password},
      {'name': 'contractaddress', 'value': contractAddress},
      {'name': 'functionname', 'value': functionName},
      {'name': 'functionarguments', 'value': encodedArgs},
      {'name': 'abi', 'value': encodedAbi},
    ],
  };
  final response = await dio.post(url, data: data);
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data as Map<String, dynamic>;
}
