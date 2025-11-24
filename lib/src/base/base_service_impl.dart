import 'package:dio/dio.dart';
import 'base.dart';
import '../api/base_api.dart';

class BaseServiceImpl implements BaseService {
  final Dio dio;
  final String baseUrl;

  BaseServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> bridgeToken({
    required String from,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String amount,
    required String admin,
    required String adminpwd,
  }) {
    return bridgeTokenBaseApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      password: password,
      contractAddress: contractAddress,
      tokenName: tokenName,
      amount: amount,
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
    return getBalanceBaseApi(
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
  }) {
    return getTokenBalanceBaseApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getTransactionsBaseApi(
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
  }) {
    return getTokenTransactionsBaseApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
    );
  }

  @override
  Future<Map<String, dynamic>> paymentInitialize({
    required String address,
    required String password,
    required String currency,
    required String token,
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
  }) {
    return paymentInitializeBaseApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      password: password,
      currency: currency,
      token: token,
      amount: amount,
      successUrl: successUrl,
      cancelUrl: cancelUrl,
      paymentType: paymentType,
      passthrough: passthrough,
      commissionRate: commissionRate,
      exchange: exchange,
      payername: payername,
      payerAddress: payerAddress,
      payerCity: payerCity,
      payerState: payerState,
      payerCountry: payerCountry,
      payerZipcode: payerZipcode,
      payerPhone: payerPhone,
      reuseWallet: reuseWallet,
      description: description,
      reference: reference,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> recordFiatTransaction({
    required String currency,
    required String txid,
    required String admin,
    required String adminpwd,
  }) {
    return recordFiatTransactionBaseApi(
      dio: dio,
      baseUrl: baseUrl,
      currency: currency,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}

