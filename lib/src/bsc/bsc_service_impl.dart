import 'package:dio/dio.dart';
import 'bsc.dart';
import '../api/bsc_api.dart';

class BSCServiceImpl implements BSCService {
  final Dio dio;
  final String baseUrl;

  BSCServiceImpl({required this.dio, required this.baseUrl});

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
    return bridgeTokenBscApi(
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
    return getBalanceBscApi(
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
    return getTokenBalanceBscApi(
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
    return getTransactionsBscApi(
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
    return getTokenTransactionsBscApi(
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
    return paymentInitializeBscApi(
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
    return recordFiatTransactionBscApi(
      dio: dio,
      baseUrl: baseUrl,
      currency: currency,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
