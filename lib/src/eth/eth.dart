/// Ethereum blockchain service interface
///
/// Provides operations for interacting with the Ethereum blockchain including:
/// - Bridge operations
/// - Balance queries
/// - Block queries
/// - Transaction queries
/// - Transfer operations
/// - Payment operations
/// - Reserve management
abstract class EthService {
  // ========== Bridge Operations ==========

  /// Bridge ERC-20 tokens from Ethereum to Toronet
  Future<Map<String, dynamic>> bridgeToken({
    required String from,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String amount,
    required String admin,
    required String adminpwd,
  });

  /// Bridge native ETH from Ethereum to Toronet
  Future<Map<String, dynamic>> bridgeGasToken({
    required String from,
    required String password,
    required String amount,
    required String admin,
    required String adminpwd,
  });

  // ========== Balance Operations ==========

  /// Get native ETH balance for an Ethereum address
  Future<Map<String, dynamic>> getBalance({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get ERC-20 token balance for an Ethereum address
  Future<Map<String, dynamic>> getTokenBalance({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Block Operations ==========

  /// Get the latest Ethereum block
  Future<Map<String, dynamic>> getLatestBlock({
    required String admin,
    required String adminpwd,
  });

  // ========== Transaction Operations ==========

  /// Get transactions for an Ethereum address
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get ERC-20 token transactions for an Ethereum address
  Future<List<Map<String, dynamic>>> getTokenTransactions({
    required String address,
    required String contractAddress,
    required String tokenName,
  });

  // ========== Transfer Operations ==========

  /// Transfer native ETH
  Future<Map<String, dynamic>> transferGasToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  });

  /// Transfer an ERC-20 token
  Future<Map<String, dynamic>> transferToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });

  // ========== Payment Operations ==========

  /// Initialize a payment using Ethereum tokens
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
  });

  /// Record a fiat transaction on Ethereum
  Future<Map<String, dynamic>> recordFiatTransaction({
    required String currency,
    required String txid,
    required String admin,
    required String adminpwd,
  });

  // ========== Reserve Operations ==========

  /// Update project ETH reserve
  Future<Map<String, dynamic>> updateProjectReserve({
    required String ethAddress,
    required String admin,
    required String adminpwd,
  });

  /// Update merchant ETH reserve
  Future<Map<String, dynamic>> updateMerchantReserve({
    required String ethAddress,
    required String admin,
    required String adminpwd,
  });
}
