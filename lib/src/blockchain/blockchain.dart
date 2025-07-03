
abstract class BlockchainService {
  Future<Map<String, dynamic>> getBlockchainStatus();
  Future<Map<String, dynamic>> getLatestBlockData();
  Future<Map<String, dynamic>> getBlocksData(int count);
  Future<Map<String, dynamic>> getBlockchainTransactions(int count);
}
