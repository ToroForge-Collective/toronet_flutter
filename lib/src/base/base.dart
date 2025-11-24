/// Base blockchain service interface
///
/// Provides operations for interacting with the Base blockchain including:
/// - Bridge operations
/// - Balance queries
/// - Transaction queries
/// - Payment operations
abstract class BaseService {
  // ========== Bridge Operations ==========

  /// Bridge tokens from Base to Toronet
  Future<Map<String, dynamic>> bridgeToken({
    required String from,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String amount,
    required String admin,
    required String adminpwd,
  });

  // ========== Balance Operations ==========

  /// Get native ETH balance
  Future<Map<String, dynamic>> getBalance({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get token balance for a Base address
  Future<Map<String, dynamic>> getTokenBalance({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Transaction Operations ==========

  /// Get transactions for a Base address
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get token transactions for a Base address
  Future<List<Map<String, dynamic>>> getTokenTransactions({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Payment Operations ==========

  /// Initialize payment with Base (USDCBASE)
  Future<Map<String, dynamic>> paymentInitialize({
    required String address,
    required String password,
    required String currency, // USDCBASE
    required String token, // TORO
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
  });

  /// Record fiat transaction for Base (USDCBASE)
  Future<Map<String, dynamic>> recordFiatTransaction({
    required String currency, // USDCBASE
    required String txid,
    required String admin,
    required String adminpwd,
  });
}

