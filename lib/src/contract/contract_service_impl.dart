import 'package:dio/dio.dart';

import 'contract.dart';
import '../api/contract_api.dart';

class ContractServiceImpl implements ContractService {
  final Dio _dio;
  final String _baseUrl;

  ContractServiceImpl({required Dio dio, required String baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl;

  @override
  Future<Map<String, dynamic>> signMessage({
    required String address,
    required String password,
    required String message,
  }) => signMessageApi(
    dio: _dio,
    baseUrl: _baseUrl,
    address: address,
    password: password,
    message: message,
  );

  @override
  Future<Map<String, dynamic>> getMessageSigner({
    required String message,
    required String signedMessage,
  }) => getMessageSignerApi(
    dio: _dio,
    baseUrl: _baseUrl,
    message: message,
    signedMessage: signedMessage,
  );

  @override
  Future<Map<String, dynamic>> callContractFunction({
    required String address,
    required String password,
    required String contractAddress,
    required String functionName,
    List<String> functionArguments = const [],
    List<Map<String, dynamic>> abi = const [],
    String? rawFunctionArguments,
    String? rawAbi,
  }) => callContractFunctionApi(
    dio: _dio,
    baseUrl: _baseUrl,
    address: address,
    password: password,
    contractAddress: contractAddress,
    functionName: functionName,
    functionArguments: functionArguments,
    abi: abi,
    rawFunctionArguments: rawFunctionArguments,
    rawAbi: rawAbi,
  );
}
