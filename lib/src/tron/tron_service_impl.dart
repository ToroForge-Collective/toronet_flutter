import 'package:dio/dio.dart';
import 'tron.dart';
import '../api/tron_api.dart';

class TronServiceImpl implements TronService {
  final Dio dio;
  final String baseUrl;

  TronServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> isValidTronAddress({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return isValidTronAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> verifyTronVirtualAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return verifyTronVirtualAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      password: password,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getBalance({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getTronBalanceApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getBalanceVirtualAddress({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getTronBalanceVirtualAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getTokenBalance({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return getTronTokenBalanceApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getTokenBalanceVirtualAddress({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return getTronTokenBalanceVirtualAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getLatestBlock({
    required String admin,
    required String adminpwd,
  }) {
    return getTronLatestBlockApi(
      dio: dio,
      baseUrl: baseUrl,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getTronTransactionsApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getTokenTransactions({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return getTronTokenTransactionsApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> transferTrx({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return transferTrxApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      to: to,
      amount: amount,
      password: password,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> transferTrxVirtualAddress({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return transferTrxVirtualAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      to: to,
      amount: amount,
      password: password,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> transferTrxToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return transferTrxTokenApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      to: to,
      amount: amount,
      password: password,
      contractAddress: contractAddress,
      tokenName: tokenName,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> transferTrxTokenVirtualAddress({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return transferTrxTokenVirtualAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      to: to,
      amount: amount,
      password: password,
      contractAddress: contractAddress,
      tokenName: tokenName,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
