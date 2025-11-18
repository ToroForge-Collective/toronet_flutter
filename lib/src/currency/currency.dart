import '../models/currency.dart';

abstract class CurrencyService {
  // Query Operations
  Future<Map<String, dynamic>> getCurrencyBalance({
    required Currency currency,
    required String address,
  });

  Future<Map<String, dynamic>> getCurrencyName({required Currency currency});

  Future<Map<String, dynamic>> getCurrencySymbol({required Currency currency});

  // Client Operations
  Future<Map<String, dynamic>> transferCurrency({
    required Currency currency,
    required String from,
    required String fromPassword,
    required String to,
    required String amount,
  });

  Future<Map<String, dynamic>> getCurrencyBalanceClient({
    required Currency currency,
    required String address,
  });

  // Owner Operations
  Future<Map<String, dynamic>> allowTransfer({
    required Currency currency,
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> disallowTransfer({
    required Currency currency,
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> mintCurrency({
    required Currency currency,
    required String owner,
    required String ownerPassword,
    required String to,
    required String amount,
  });

  Future<Map<String, dynamic>> burnCurrency({
    required Currency currency,
    required String owner,
    required String ownerPassword,
    required String from,
    required String amount,
  });

  // Admin Operations
  Future<Map<String, dynamic>> freezeCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  });

  Future<Map<String, dynamic>> unfreezeCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  });

  Future<Map<String, dynamic>> enrollCurrency({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String address,
  });

  Future<Map<String, dynamic>> mintCurrencyAdmin({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String to,
    required String amount,
  });

  Future<Map<String, dynamic>> burnCurrencyAdmin({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String from,
    required String amount,
  });

  Future<Map<String, dynamic>> setAllowances({
    required Currency currency,
    required String admin,
    required String adminPassword,
    required String minimum,
    required String maximum,
  });

  // Fee Operations
  Future<Map<String, dynamic>> getTransactionFeeFixed({
    required Currency currency,
  });

  Future<Map<String, dynamic>> getTransactionFeePercentage({
    required Currency currency,
  });

  Future<Map<String, dynamic>> getTransactionFee({
    required Currency currency,
    required String amount,
  });
}
