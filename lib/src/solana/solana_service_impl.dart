import 'package:dio/dio.dart';
import 'solana.dart';
import '../api/solana_api.dart';

class SolanaServiceImpl implements SolanaService {
  final Dio dio;
  final String baseUrl;

  SolanaServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> createSolanaAddress({
    required String admin,
    required String adminpwd,
  }) {
    return createSolanaAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> isValidSolanaAddress({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return isValidSolanaAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> createToronetSolanaAddress({
    required String address,
    required String password,
  }) {
    return createToronetSolanaAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      password: password,
    );
  }

  @override
  Future<Map<String, dynamic>> generateVirtualWallet({
    required String address,
    required String password,
    required String payername,
    required String currency,
    required String admin,
    required String adminpwd,
  }) {
    return generateVirtualWalletSolanaApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      password: password,
      payername: payername,
      currency: currency,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> verifySolanaAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return verifySolanaAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      password: password,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> verifySolanaToronetAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return verifySolanaToronetAddressApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      password: password,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> transferSolana({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  }) {
    return transferSolanaApi(
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
  Future<Map<String, dynamic>> transferSolToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    String? useTokenAsFees,
    required String admin,
    required String adminpwd,
  }) {
    return transferSolTokenApi(
      dio: dio,
      baseUrl: baseUrl,
      from: from,
      to: to,
      amount: amount,
      password: password,
      contractAddress: contractAddress,
      tokenName: tokenName,
      useTokenAsFees: useTokenAsFees,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getSolBalance({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getSolBalanceApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getSolTokenBalance({
    required String address,
    required String contractAddress,
    required String admin,
    required String adminpwd,
  }) {
    return getSolTokenBalanceApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getSolLatestBlock({
    required String admin,
    required String adminpwd,
  }) {
    return getSolLatestBlockApi(
      dio: dio,
      baseUrl: baseUrl,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getSolTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  }) {
    return getSolTransactionsApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getSolTokenTransactions({
    required String address,
    required String contractAddress,
    required String admin,
    required String adminpwd,
  }) {
    return getSolTokenTransactionsApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      contractAddress: contractAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

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
    return bridgeTokenSolApi(
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
  Future<Map<String, dynamic>> getBridgeTokenFee({
    required String contractAddress,
    required String amount,
    required String admin,
    required String adminpwd,
  }) {
    return getBridgeTokenFeeSolApi(
      dio: dio,
      baseUrl: baseUrl,
      contractAddress: contractAddress,
      amount: amount,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> updateMerchantSolReserve({
    required String solAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateMerchantSolReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      solAddress: solAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> updateProjectSolReserve({
    required String solAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateProjectSolReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      solAddress: solAddress,
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
    return paymentInitializeSolApi(
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
    return recordFiatTransactionSolApi(
      dio: dio,
      baseUrl: baseUrl,
      currency: currency,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
