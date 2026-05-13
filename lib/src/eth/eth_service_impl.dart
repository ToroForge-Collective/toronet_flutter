import 'package:dio/dio.dart';
import 'eth.dart';
import '../api/eth_api.dart';

class EthServiceImpl implements EthService {
  final Dio dio;
  final String baseUrl;

  EthServiceImpl({required this.dio, required this.baseUrl});

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
    return bridgeTokenEthApi(
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
  Future<Map<String, dynamic>> bridgeGasToken({
    required String from,
    required String password,
    required String amount,
    required String admin,
    required String adminpwd,
  }) {
    return bridgeGasTokenEthApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      password: password,
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
    return getBalanceEthApi(
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
    return getTokenBalanceEthApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
    );
  }

  @override
  Future<Map<String, dynamic>> getLatestBlock({
    required String admin,
    required String adminpwd,
  }) {
    return getLatestBlockEthApi(
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
    return getTransactionsEthApi(
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
    return getTokenTransactionsEthApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      tokenName: tokenName,
    );
  }

  @override
  Future<Map<String, dynamic>> transferGasToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return transferGasTokenEthApi(
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
  Future<Map<String, dynamic>> transferToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  }) {
    return transferTokenEthApi(
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
    return paymentInitializeEthApi(
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
    return recordFiatTransactionEthApi(
      dio: dio,
      baseUrl: baseUrl,
      currency: currency,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> updateProjectReserve({
    required String ethAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateProjectEthReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      ethAddress: ethAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> updateMerchantReserve({
    required String ethAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateMerchantEthReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      ethAddress: ethAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
