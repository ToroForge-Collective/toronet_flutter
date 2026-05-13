/// Avalanche (AVAX) reserve management service interface
abstract class AvaxService {
  /// Update project AVAX reserve
  Future<Map<String, dynamic>> updateProjectReserve({
    required String avaxAddress,
    required String admin,
    required String adminpwd,
  });

  /// Update merchant AVAX reserve
  Future<Map<String, dynamic>> updateMerchantReserve({
    required String avaxAddress,
    required String admin,
    required String adminpwd,
  });
}
