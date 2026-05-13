/// Tron (TRX) blockchain service interface
///
/// Provides operations for interacting with the Tron blockchain including:
/// - Address validation and verification
/// - Balance queries (standard and virtual address)
/// - Block queries
/// - Transaction queries
/// - TRX and TRC-20 token transfers
abstract class TronService {
  // ========== Address Operations ==========

  /// Validate if a Tron address is valid
  Future<Map<String, dynamic>> isValidTronAddress({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Verify a Tron virtual address
  Future<Map<String, dynamic>> verifyTronVirtualAddress({
    required String from,
    required String password,
    required String admin,
    required String adminpwd,
  });

  // ========== Balance Operations ==========

  /// Get native TRX balance for an address
  Future<Map<String, dynamic>> getBalance({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get native TRX balance for a virtual address
  Future<Map<String, dynamic>> getBalanceVirtualAddress({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get TRC-20 token balance for an address
  Future<Map<String, dynamic>> getTokenBalance({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });

  /// Get TRC-20 token balance for a virtual address
  Future<Map<String, dynamic>> getTokenBalanceVirtualAddress({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });

  // ========== Block Operations ==========

  /// Get the latest Tron block
  Future<Map<String, dynamic>> getLatestBlock({
    required String admin,
    required String adminpwd,
  });

  // ========== Transaction Operations ==========

  /// Get TRX transactions for an address
  Future<List<Map<String, dynamic>>> getTransactions({
    required String address,
    required String admin,
    required String adminpwd,
  });

  /// Get TRC-20 token transactions for an address
  Future<List<Map<String, dynamic>>> getTokenTransactions({
    required String address,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });

  // ========== Transfer Operations ==========

  /// Transfer native TRX
  Future<Map<String, dynamic>> transferTrx({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  });

  /// Transfer native TRX from a virtual address
  Future<Map<String, dynamic>> transferTrxVirtualAddress({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String admin,
    required String adminpwd,
  });

  /// Transfer a TRC-20 token
  Future<Map<String, dynamic>> transferTrxToken({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });

  /// Transfer a TRC-20 token from a virtual address
  Future<Map<String, dynamic>> transferTrxTokenVirtualAddress({
    required String from,
    required String to,
    required String amount,
    required String password,
    required String contractAddress,
    required String tokenName,
    required String admin,
    required String adminpwd,
  });
}
