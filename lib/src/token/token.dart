abstract class TokenService {
  // Metadata Operations
  Future<Map<String, dynamic>> getTokenName({required String tokenType});

  Future<Map<String, dynamic>> getTokenSymbol({required String tokenType});

  Future<Map<String, dynamic>> getTokenDecimal({required String tokenType});

  // Balance Operations
  Future<Map<String, dynamic>> getTokenBalance({
    required String tokenType,
    required String address,
  });

  // Allowances Operations
  Future<Map<String, dynamic>> getMinimumAllowance({required String tokenType});

  Future<Map<String, dynamic>> getMaximumAllowance({required String tokenType});

  Future<Map<String, dynamic>> getAllowance({
    required String tokenType,
    required String owner,
    required String spender,
  });

  // Fee Operations
  Future<Map<String, dynamic>> getTransactionFeeFixed({
    required String tokenType,
  });

  Future<Map<String, dynamic>> getTransactionFeePercentage({
    required String tokenType,
  });

  Future<Map<String, dynamic>> getTransactionFee({
    required String tokenType,
    required String amount,
  });

  // Supply Operations
  Future<Map<String, dynamic>> getReserve({required String tokenType});

  Future<Map<String, dynamic>> getToller({required String tokenType});

  Future<Map<String, dynamic>> getTotalCap({required String tokenType});

  Future<Map<String, dynamic>> getTotalReserving({required String tokenType});

  Future<Map<String, dynamic>> getTotalCirculating({required String tokenType});

  // Status Operations
  Future<bool> isTokenEnrolled({
    required String tokenType,
    required String address,
  });

  Future<bool> isTokenFrozen({
    required String tokenType,
    required String address,
  });

  Future<bool> isTransferOn({required String tokenType});

  Future<bool> isMintOn({required String tokenType});

  Future<bool> isBurnOn({required String tokenType});

  // Self-Enrollment Operations
  Future<Map<String, dynamic>> selfEnrollToken({
    required String tokenType,
    required String address,
    required String password,
  });
}
