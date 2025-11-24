/// Arbitrum blockchain service interface
///
/// Provides operations for interacting with the Arbitrum blockchain including:
/// - Bridge operations
/// - Balance queries
/// - Transaction queries
/// - Payment operations
abstract class ArbitrumService {
  // ========== Bridge Operations ==========

  /// Bridge tokens from Arbitrum to Toronet
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

  /// Get token balance for an Arbitrum address
  Future<Map<String, dynamic>> getTokenBalance({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Transaction Operations ==========

  /// Get transactions for an Arbitrum address
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get token transactions for an Arbitrum address
  Future<List<Map<String, dynamic>>> getTokenTransactions({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Payment Operations ==========

  /// Initialize payment with Arbitrum (USDCARB)
  Future<Map<String, dynamic>> paymentInitialize({
    required String address,
    required String password,
    required String currency, // USDCARB
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

  /// Record fiat transaction for Arbitrum (USDCARB)
  Future<Map<String, dynamic>> recordFiatTransaction({
    required String currency, // USDCARB
    required String txid,
    required String admin,
    required String adminpwd,
  });
}

