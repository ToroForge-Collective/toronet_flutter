abstract class VirtualService {
  Future<Map<String, dynamic>> createVirtualWallet({
    required String address,
    required String payername,
    required String currency,
    required String admin,
    required String adminPassword,
  });

  Future<Map<String, dynamic>> fetchVirtualWallet({
    required String virtualWalletId,
    required String admin,
    required String adminPassword,
  });

  Future<Map<String, dynamic>> fetchVirtualWalletByAddress({
    required String address,
    required String admin,
    required String adminPassword,
  });

  Future<Map<String, dynamic>> updateVirtualWalletTransactions({
    required String walletAddress,
    required String admin,
    required String adminPassword,
  });
}
