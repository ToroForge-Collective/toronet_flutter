/// Solana blockchain service interface
///
/// Provides operations for interacting with the Solana blockchain including:
/// - Address creation and validation
/// - Virtual wallet management
/// - Native SOL and token transfers
/// - Balance queries
/// - Transaction queries
/// - Bridge operations
/// - Payment operations
abstract class SolanaService {
  // ========== Address Operations ==========

  /// Create a new Solana address
  Future<Map<String, dynamic>> createSolanaAddress({
    required String admin,
    required String adminpwd,
  });

  /// Validate if a Solana address is valid
  Future<Map<String, dynamic>> isValidSolanaAddress({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Create a Toronet-linked Solana address from a Toronet address
  Future<Map<String, dynamic>> createToronetSolanaAddress({
    required String address,
    required String password,
  });

  // ========== Virtual Wallet Operations ==========

  /// Generate a virtual wallet for Solana (USDTSOL or SOL)
  Future<Map<String, dynamic>> generateVirtualWallet({
    required String address,
    required String password,
    required String payername,
    required String currency, // USDTSOL or SOL
    required String admin,
    required String adminpwd,
  });

  // ========== Verification Operations ==========

  /// Verify a Solana address with encryption
  Future<Map<String, dynamic>> verifySolanaAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  });

  /// Verify a Solana address linked to a Toronet address
  Future<Map<String, dynamic>> verifySolanaToronetAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  });

  // ========== Transfer Operations ==========

  /// Transfer native SOL
  Future<Map<String, dynamic>> transferSolana({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  });

  /// Transfer SOL tokens (SPL tokens)
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
  });

  // ========== Balance Operations ==========

  /// Get native SOL balance
  Future<Map<String, dynamic>> getSolBalance({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get token balance for a Solana address
  Future<Map<String, dynamic>> getSolTokenBalance({
    required String address,
    required String contractAddress,
    required String admin,
    required String adminpwd,
  });

  // ========== Transaction Operations ==========

  /// Get the latest Solana block
  Future<Map<String, dynamic>> getSolLatestBlock({
    required String admin,
    required String adminpwd,
  });

  /// Get transactions for a Solana address
  Future<List<Map<String, dynamic>>> getSolTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get token transactions for a Solana address
  Future<List<Map<String, dynamic>>> getSolTokenTransactions({
    required String address,
    required String contractAddress,
    required String admin,
    required String adminpwd,
  });

  // ========== Bridge Operations ==========

  /// Bridge tokens from Solana to Toronet
  Future<Map<String, dynamic>> bridgeToken({
    required String from,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String amount,
    required String admin,
    required String adminpwd,
  });

  /// Get bridge token fee for Solana
  Future<Map<String, dynamic>> getBridgeTokenFee({
    required String contractAddress,
    required String amount,
    required String admin,
    required String adminpwd,
  });

  // ========== Reserve Operations ==========

  /// Update merchant Solana reserve
  Future<Map<String, dynamic>> updateMerchantSolReserve({
    required String solAddress,
    required String admin,
    required String adminpwd,
  });

  /// Update project Solana reserve
  Future<Map<String, dynamic>> updateProjectSolReserve({
    required String solAddress,
    required String admin,
    required String adminpwd,
  });

  // ========== Payment Operations ==========

  /// Initialize payment with Solana (SOL or USDCSOL)
  Future<Map<String, dynamic>> paymentInitialize({
    required String address,
    required String password,
    required String currency, // SOL or USDCSOL
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

  /// Record fiat transaction for Solana (SOL or USDCSOL)
  Future<Map<String, dynamic>> recordFiatTransaction({
    required String currency, // SOL or USDCSOL
    required String txid,
    required String admin,
    required String adminpwd,
  });
}

