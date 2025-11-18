import 'package:dio/dio.dart';
import 'token.dart';
import '../api/token_api.dart';

class TokenServiceImpl implements TokenService {
  final Dio dio;
  final String baseUrl;

  TokenServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getTokenName({required String tokenType}) {
    return getTokenNameApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTokenSymbol({required String tokenType}) {
    return getTokenSymbolApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTokenDecimal({required String tokenType}) {
    return getTokenDecimalApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTokenBalance({
    required String tokenType,
    required String address,
  }) {
    return getTokenBalanceApi(dio, baseUrl, tokenType, address);
  }

  @override
  Future<Map<String, dynamic>> getMinimumAllowance({
    required String tokenType,
  }) {
    return getMinimumAllowanceApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getMaximumAllowance({
    required String tokenType,
  }) {
    return getMaximumAllowanceApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getAllowance({
    required String tokenType,
    required String owner,
    required String spender,
  }) {
    return getAllowanceApi(dio, baseUrl, tokenType, owner, spender);
  }

  @override
  Future<Map<String, dynamic>> getTransactionFeeFixed({
    required String tokenType,
  }) {
    return getTransactionFeeFixedApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTransactionFeePercentage({
    required String tokenType,
  }) {
    return getTransactionFeePercentageApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTransactionFee({
    required String tokenType,
    required String amount,
  }) {
    return getTransactionFeeApi(dio, baseUrl, tokenType, amount);
  }

  @override
  Future<Map<String, dynamic>> getReserve({required String tokenType}) {
    return getReserveApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getToller({required String tokenType}) {
    return getTollerApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTotalCap({required String tokenType}) {
    return getTotalCapApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTotalReserving({required String tokenType}) {
    return getTotalReservingApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> getTotalCirculating({
    required String tokenType,
  }) {
    return getTotalCirculatingApi(dio, baseUrl, tokenType);
  }

  @override
  Future<bool> isTokenEnrolled({
    required String tokenType,
    required String address,
  }) {
    return isTokenEnrolledApi(dio, baseUrl, tokenType, address);
  }

  @override
  Future<bool> isTokenFrozen({
    required String tokenType,
    required String address,
  }) {
    return isTokenFrozenApi(dio, baseUrl, tokenType, address);
  }

  @override
  Future<bool> isTransferOn({required String tokenType}) {
    return isTransferOnApi(dio, baseUrl, tokenType);
  }

  @override
  Future<bool> isMintOn({required String tokenType}) {
    return isMintOnApi(dio, baseUrl, tokenType);
  }

  @override
  Future<bool> isBurnOn({required String tokenType}) {
    return isBurnOnApi(dio, baseUrl, tokenType);
  }

  @override
  Future<Map<String, dynamic>> selfEnrollToken({
    required String tokenType,
    required String address,
    required String password,
  }) {
    return selfEnrollTokenApi(dio, baseUrl, tokenType, address, password);
  }
}
