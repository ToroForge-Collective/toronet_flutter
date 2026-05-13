abstract class RawService {
  /// Send a raw signed transaction to the blockchain
  Future<Map<String, dynamic>> sendRawData({required String rawData});
}
