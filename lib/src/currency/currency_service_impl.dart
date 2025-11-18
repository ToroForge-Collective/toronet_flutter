import 'package:dio/dio.dart';
import 'currency.dart';
import '../api/currency_api.dart';
import '../models/currency.dart';

class CurrencyServiceImpl implements CurrencyService {
  final Dio dio;
  final String baseUrl;

  CurrencyServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getCurrencyBalance({
    required Currency currency,
    required String address,
  }) {
    return getCurrencyBalanceApi(dio, baseUrl, currency, address);
  }

  @override
  Future<Map<String, dynamic>> getCurrencyName({required Currency currency}) {
    return getCurrencyNameApi(dio, baseUrl, currency);
  }

  @override
  Future<Map<String, dynamic>> getCurrencySymbol({required Currency currency}) {
    return getCurrencySymbolApi(dio, baseUrl, currency);
  }

  @override
  Future<Map<String, dynamic>> transferCurrency({
    required Currency currency,
    required String from,
    required String fromPassword,
    required String to,
    required String amount,
  }) {
    return transferCurrencyApi(
      dio,
      baseUrl,
      currency,
      from,
      fromPassword,
      to,
      amount,
    );
  }

  @override
  Future<Map<String, dynamic>> getCurrencyBalanceClient({
    required Currency currency,
    required String address,
  }) {
    return getCurrencyBalanceClientApi(dio, baseUrl, currency, address);
  }

  @override
  Future<Map<String, dynamic>> allowTransfer({
    required Currency currency,
    required String owner,
    required String ownerPassword,
  }) {
    return allowTransferApi(dio, baseUrl, currency, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> disallowTransfer({
    required Currency currency,
    required String owner,
    required String ownerPassword,
  }) {
    return disallowTransferApi(dio, baseUrl, currency, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> mintCurrency({
    required Currency currency,
    required String owner,
    required String ownerPassword,
    required String to,
    required String amount,
  }) {
    return mintCurrencyApi(
      dio,
      baseUrl,
      currency,
      owner,
      ownerPassword,
      to,
      amount,
    );
  }

  @override
  Future<Map<String, dynamic>> burnCurrency({
    required Currency currency,
    required String owner,
    required String ownerPassword,
    required String from,
    required String amount,
  }) {
    return burnCurrencyApi(
      dio,
      baseUrl,
      currency,
      owner,
      ownerPassword,
      from,
      amount,
    );
  }

  @override
  Future<Map<String, dynamic>> freezeCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  }) {
    return freezeCurrencyApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      address,
    );
  }

  @override
  Future<Map<String, dynamic>> unfreezeCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  }) {
    return unfreezeCurrencyApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      address,
    );
  }

  @override
  Future<Map<String, dynamic>> enrollCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  }) {
    return enrollCurrencyApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      address,
    );
  }

  @override
  Future<Map<String, dynamic>> mintCurrencyAdmin({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String to,
    required String amount,
  }) {
    return mintCurrencyAdminApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      to,
      amount,
    );
  }

  @override
  Future<Map<String, dynamic>> burnCurrencyAdmin({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String from,
    required String amount,
  }) {
    return burnCurrencyAdminApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      from,
      amount,
    );
  }

  @override
  Future<Map<String, dynamic>> setAllowances({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String minimum,
    required String maximum,
  }) {
    return setAllowancesApi(
      dio,
      baseUrl,
      currency,
      admin,
      adminPassword,
      minimum,
      maximum,
    );
  }

  @override
  Future<Map<String, dynamic>> getTransactionFeeFixed({
    required Currency currency,
  }) {
    return getTransactionFeeFixedApi(dio, baseUrl, currency);
  }

  @override
  Future<Map<String, dynamic>> getTransactionFeePercentage({
    required Currency currency,
  }) {
    return getTransactionFeePercentageApi(dio, baseUrl, currency);
  }

  @override
  Future<Map<String, dynamic>> getTransactionFee({
    required Currency currency,
    required String amount,
  }) {
    return getTransactionFeeApi(dio, baseUrl, currency, amount);
  }
}
