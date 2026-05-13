abstract class UtilService {
  /// Check if an address is a valid Toronet address
  Future<Map<String, dynamic>> isAddress({required String address});

  /// Get the transaction count (nonce) for an address
  Future<Map<String, dynamic>> getTransactionCount({required String address});
}
